# ============================================================================ #
#
# A Node.js+Nix package collection made with floco.
#
# ---------------------------------------------------------------------------- #

{
  description = "A Node.js+Nix package collection made with floco";

  inputs.nixpkgs.url     = "github:NixOS/nixpkgs";
  inputs.at-node-nix.url = "github:aameen-tulip/at-node-nix";
  inputs.at-node-nix.inputs.nixpkgs.follows = "/nixpkgs";

# ---------------------------------------------------------------------------- #

  outputs = { self, nixpkgs, at-node-nix, ... }: let

    lib = at-node-nix.lib.extend self.overlays.lib;

    pkgsForSys = system:
      nixpkgs.legacyPackages.${system}.extend self.overlays.default;

    supportedSystems = lib.defaultSystems;
    eachSupportedSystemMap = lib.eachSystemMap supportedSystems;

  in {  # Begin Outputs

# ---------------------------------------------------------------------------- #

    inherit lib;

# ---------------------------------------------------------------------------- #

    overlays.deps = lib.composeManyExtensions [
      at-node-nix.overlays.at-node-nix
    ];

    # By default, compose with our deps into a single overlay.
    overlays.default = lib.composeManyExtensions [
      self.overlays.deps
      self.overlays.pkgs
      self.overlays.simple
    ];


# ---------------------------------------------------------------------------- #

    # Pure `lib' extensions.
    overlays.lib  = final: prev: let
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
        j  = prev.importJSON ./config/flocoConfig.json;
        m  = prev.recursiveUpdate j ( prev.flocoConfig or {} );
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
      lib    = prev.lib.extend self.overlays.lib;
      config = lib.recursiveUpdate prev.config nixpkgsConfig;
    };

    overlays.simple = import ./pkgs/SIMPLE/overlay.nix;


# ---------------------------------------------------------------------------- #

    # Installable Packages for Flake CLI.
    packages = eachSupportedSystemMap ( system: let
      pkgsFor = pkgsForSys system;
    in {

      tests = ( import ./tests {
        inherit system lib pkgsFor;
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
