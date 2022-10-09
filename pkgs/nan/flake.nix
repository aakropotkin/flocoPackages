{
  inputs.nan--latest.url   = "https://registry.npmjs.org/nan/-/nan-2.16.0.tgz";
  inputs.nan--latest.flake = false;
  inputs.nan--src.follows  = "nan--latest";
  inputs.nan--src.flake    = false;
  inputs.at-node-nix.url   = "github:aameen-tulip/at-node-nix";
  inputs.floco.follows     = "/at-node-nix";
  outputs = { floco, nan--src, ... }: let
    pjs = floco.lib.importJSON "${nan--src}/package.json";
    overlays = {
      nan = final: prev: {
        flocoPackages = floco.lib.addFlocoPackages prev {
          nan = {
            ident = pjs.name;
            inherit (pjs) version;
            inherit (nan--src) outPath;
          };
        };
      };
      default = overlays.nan;
    };
  in {
    inherit overlays;
    packages = floco.lib.eachDefaultSystemMap ( system: let
      pkgsFor = floco.legacyPackages.${system}.extend overlays.default;
      nan = pkgsFor.copyOut {
        name = ( floco.lib.libmeta.metaEntNames pjs ).names.src;
        src  = pkgsFor.flocoPackages.nan;
        extraAttrs.meta     = { inherit (pjs) name version; };
        extraAttrs.passthru = { inherit pjs; };
      };
    in { inherit nan; default = nan; } );
  };
}
