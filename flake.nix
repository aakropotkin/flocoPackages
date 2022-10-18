# ============================================================================ #
#
# A Node.js+Nix package collection made with floco.
#
# ---------------------------------------------------------------------------- #

{
  description = "A Node.js+Nix package collection made with floco";

  inputs.nixpkgs.follows = "/at-node-nix/nixpkgs";
  inputs.at-node-nix.url = "github:aameen-tulip/at-node-nix";

# ---------------------------------------------------------------------------- #

  outputs = { nixpkgs, at-node-nix, ... }: let

    pkgsForSys = system:
      nixpkgs.legacyPackages.${system}.extend overlays.default;

    supportedSystems       = at-node-nix.lib.defaultSystems;
    eachSupportedSystemMap = at-node-nix.lib.eachSystemMap supportedSystems;

# ---------------------------------------------------------------------------- #

    # Pure `lib' extensions.
    libOverlays.default = final: prev: let
      callLibWith = { lib ? final, ... } @ auto: x: let
        f    = if prev.lib.isFunction x then x else import x;
        args = builtins.intersectAttrs ( builtins.functionArgs f )
                                       ( { inherit lib; } // auto );
      in f args;
      callLibsWith = auto: lst:
        builtins.foldl' ( acc: x: acc // ( callLibWith auto x ) ) {} lst;
      callLib  = callLibWith {};
      callLibs = callLibsWith {};
    in {
      flocoConfig = let
        j = prev.importJSON ./config/flocoConfig.json;
        m = prev.recursiveUpdate j ( prev.flocoConfig or {} );
      in prev.libcfg.mkFlocoConfig m;
    };


# ---------------------------------------------------------------------------- #

    # Nixpkgs overlay: Builders, Packages, Overrides, etc.
    overlays.pkgs = final: prev: let
      callPackagesWith = auto: prev.lib.callPackagesWith ( final // auto );
      callPackageWith  = auto: prev.lib.callPackageWith ( final // auto );
      callPackages     = callPackagesWith {};
      callPackage      = callPackageWith {};
      nixpkgsConfig    = prev.lib.importJSON ./config/nixpkgsConfig.json;
    in {

      # Disables `checkMeta'
      config = prev.lib.recursiveUpdate prev.config nixpkgsConfig;
      lib    = prev.lib.extend libOverlays.default;

      flocoPackages = prev.lib.makeExtensible ( fpSelf: let
        callFlocoPackage = prev.lib.callPackageWith {
          inherit (final)
            stdenv lib copyOut buildGyp darwin
          ;
          inherit (final.darwin.apple_sdk.frameworks)
            CoreServices
          ;
          flocoPackages = fpSelf;
        };
      in {
        "fsevents/1.2.13" = callFlocoPackage ./pkgs/fsevents/1.2.13 {
          fsevents-src = builtins.fetchTree {
            type = "tarball";
            url = "https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz";
            narHash = "sha256-prK0V63HoVHzoQrTB6MzYEloOwBo5qvSnYVUrg9SFE8=";
          };
        };
      } );  # End flocoPackages

    }; # End `pkgs' overlay

    overlays.simple = import ./pkgs/SIMPLE/overlay.nix;

    overlays.deps = at-node-nix.overlays.default;

    # By default, compose with our deps into a single overlay.
    overlays.default = nixpkgs.lib.composeManyExtensions [
      overlays.deps
      overlays.pkgs
      overlays.simple
    ];


# ---------------------------------------------------------------------------- #

  in {  # Begin Outputs

# ---------------------------------------------------------------------------- #

    inherit overlays;
    flocoPackagesFor = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.${system}.extend overlays.default;
    in pkgsFor.flocoPackages );

# ---------------------------------------------------------------------------- #

    # Installable Packages for Flake CLI.
    packages = eachSupportedSystemMap ( system: let
      pkgsFor  = pkgsForSys system;
    in {

      fsevents--1_2_13 = pkgsFor.flocoPackages."fsevents/1.2.13";

      tests = ( import ./tests {
        inherit system pkgsFor;
        lib = at-node-nix.lib.extend libOverlays.default;
        enableTraces = true;
      } ).checkDrv;

    } );  # End Packages


# ---------------------------------------------------------------------------- #

  };  # End Outputs
}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
