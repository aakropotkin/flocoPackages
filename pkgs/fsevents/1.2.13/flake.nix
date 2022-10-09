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

  outputs = { floco, fsevents-src, nan-src, ... }: let
    inherit (floco) lib;
    overlays = {
      fsevents = final: prev: {
        flocoPackages = lib.addFlocoPackages prev {
          nan      = nan-src;
          # XXX: Only builds on Darwin. Linux just copies to store.
          fsevents = lib.callPackageWith final ./default.nix {
            inherit fsevents-src;
            inherit (prev.darwin.apple_sdk.frameworks) CoreServices;
          };
        };
      };
      default = overlays.fsevents;
    };
  in {
    inherit overlays;
    packages = lib.eachDefaultSystemMap ( system: let
      pkgsFor = floco.legacyPackages.${system}.extend overlays.fsevents;
    in {
      inherit (pkgsFor.flocoPackages) fsevents;
      default = pkgsFor.flocoPackages.fsevents;
    } );
  };
}
