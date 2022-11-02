{
  inputs.fsevents--1_2_13.url =
    "https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz";
  inputs.fsevents--1_2_13.flake = false;
  inputs.fsevents-src.follows = "/fsevents--1_2_13";
  inputs.fsevents-src.flake = false;

  inputs.nan--2_16_0.url = "https://registry.npmjs.org/nan/-/nan-2.16.0.tgz";
  inputs.nan--2_16_0.flake = false;
  inputs.nan-src.follows = "/nan--2_16_0";
  inputs.nan-src.flake = false;

  inputs.at-node-nix.url = "github:aameen-tulip/at-node-nix";
  inputs.floco.follows   = "/at-node-nix";


# ---------------------------------------------------------------------------- #

  outputs = { floco, fsevents-src, nan-src, ... }: let

# ---------------------------------------------------------------------------- #

    fsevents-meta = let
      pjs = floco.lib.importJSON "${fsevents-src}/package.json";
    in {
      ident = pjs.name;
      key   = "${pjs.name}/${pjs.version}";
      inherit (pjs) version;
    };


    nan-meta = let
      pjs = floco.lib.importJSON "${nan-src}/package.json";
    in {
      ident = pjs.name;
      key   = "${pjs.name}/${pjs.version}";
      inherit (pjs) version;
    };


# ---------------------------------------------------------------------------- #

    overlays.nan = final: prev: {
      # We can't assume `flocoPackages' is defined yet.
      flocoPackages = final.lib.addFlocoPackages prev {
        ${nan-meta.key} = nan-meta // {
          type       = "tarball";
          sourceInfo = nan-src;
          meta       = nan-meta;
          inherit (nan-src) outPath;
        };
      };
    };

    overlays.deps = floco.lib.composeExtensions floco.overlays.default
                                                overlays.nan;

    overlays.fsevents = final: prev: {
      flocoPackages = prev.flocoPackages.extend ( fpFinal: fpPrev: {
        # XXX: Only builds on Darwin. Linux just copies to store.
        ${fsevents-meta.key} =
          final.lib.makeOverridable ( import ./default.nix ) {
            src           = fsevents-src;
            flocoPackages = fpFinal;
            nan           = fpFinal.${nan-meta.key};
            meta          = fsevents-meta;
            inherit (final) lib stdenv copyOut buildGyp;
            inherit (prev.darwin.apple_sdk.frameworks) CoreServices;
          };
      } );
    };
    
    overlays.default = floco.lib.composeExtensions overlays.deps
                                                   overlays.fsevents;


# ---------------------------------------------------------------------------- #

  in {  # Begin Outputs

    inherit overlays;

    packages = floco.lib.eachDefaultSystemMap ( system: let
      pkgsFor = floco.legacyPackages.${system}.extend overlays.default;
      fsevents = pkgsFor.flocoPackages."${fsevents-meta.key}";
    in {
      inherit fsevents;
      default = fsevents;
    } );

  };  # End Outputs

# ---------------------------------------------------------------------------- #

}
