{
  inputs.nan--latest.url   = "https://registry.npmjs.org/nan/-/nan-2.17.0.tgz";
  inputs.nan--latest.flake = false;
  inputs.nan--src.follows  = "nan--latest";
  inputs.nan--src.flake    = false;
  inputs.at-node-nix.url   = "github:aameen-tulip/at-node-nix";
  inputs.floco.follows     = "/at-node-nix";

  outputs = { floco, nan--src, ... } @ inputs: let

    pjs = floco.lib.importJSON "${nan--src}/package.json";
    nan-meta = {
      ident = pjs.name;
      key   = "${pjs.name}/${pjs.version}";
      inherit (pjs) version;
    };

    overlays = {
      nan = final: prev: {
        flocoPackages = floco.lib.addFlocoPackages prev {
          ${nan-meta.key} = {
            ident = pjs.name;
            inherit (pjs) version;
            inherit (nan--src) outPath;
            sourceInfo = nan--src;
            meta       = nan-meta;
            passthru = { inherit pjs; };
          };
        };
      };
      default = overlays.nan;
    };

  in {  # Begin Outputs

    meta = nan-meta;
    inherit pjs;

    inherit overlays;
    packages = floco.lib.eachDefaultSystemMap ( system: let
      pkgsFor = floco.legacyPackages.${system}.extend overlays.default;
      nan = pkgsFor.coerceDrv {
        name = ( floco.lib.libmeta.metaEntNames pjs ).names.src;
        inherit (pjs) version;
        src = pkgsFor.flocoPackages."${nan-meta.key}";
        meta     = nan-meta;
        passthru = { inherit pjs; };
      };
    in { inherit nan; default = nan; } );
  };  # End Outputs

}
