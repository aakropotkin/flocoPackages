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
    libOverlays.default = import ./lib/overlay.lib.nix;

# ---------------------------------------------------------------------------- #

    # Nixpkgs overlay: Builders, Packages, Overrides, etc.
    overlays.pkgs   = import ./overlay.nix;
    overlays.simple = import ./pkgs/SIMPLE/overlay.nix;
    overlays.bins   = import ./pkgs/BINS/overlay.nix;
    overlays.gyp    = import ./pkgs/GYP/overlay.nix;
    overlays.deps   = at-node-nix.overlays.default;

    # By default, compose with our deps into a single overlay.
    overlays.default = nixpkgs.lib.composeManyExtensions [
      overlays.deps
      overlays.pkgs
      overlays.simple
      overlays.bins
      overlays.gyp
    ];


# ---------------------------------------------------------------------------- #

    # Installable Packages for Flake CLI.
    packages = eachSupportedSystemMap ( system: let
      pkgsFor = pkgsForSys system;

      bins'   = pkgsFor.flocoApps;
      no-i686 = removeAttrs bins' ["swc--core" "msgpackr-extract"];

      bins = if system != "i686-linux" then bins' else no-i686;

    in bins // {

      fsevents--1_2_13 = pkgsFor.flocoPackages."fsevents/1.2.13".prepared;

      tests = ( import ./tests {
        inherit system pkgsFor;
        lib = at-node-nix.lib.extend libOverlays.default;
        enableTraces = true;
      } ).checkDrv;

    } );  # End Packages


# ---------------------------------------------------------------------------- #

  in {  # Begin Outputs

# ---------------------------------------------------------------------------- #

    lib = at-node-nix.lib.extend libOverlays.default;

    inherit overlays packages;

    flocoPackagesFor = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.${system}.extend overlays.default;
    in pkgsFor.flocoPackages );

# ---------------------------------------------------------------------------- #

    checks = eachSupportedSystemMap ( system: {
      inherit (packages.${system})
        fsevents--1_2_13
        tests
        acorn
        typescript
        semver
        eslint
        esbuild
      ;
      esbuild--test = packages.${system}.esbuild.passthru.test.runVersion;
    } );


# ---------------------------------------------------------------------------- #

  };  # End Outputs
}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
