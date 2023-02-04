{

# ---------------------------------------------------------------------------- #

  inputs.floco.url       = "github:aakropotkin/floco";
  inputs.nixpkgs.follows = "/floco/nixpkgs";

# ---------------------------------------------------------------------------- #

  outputs = { nixpkgs, floco, ... } @ inputs: let

# ---------------------------------------------------------------------------- #

    supportedSystems = [
      "x86_64-linux"  "aarch64-linux"  "i686-linux" 
      "x86_64-darwin" "aarch64-darwin"
    ];

    eachSupportedSystemMap = f: builtins.foldl' ( acc: system: acc // {
      ${system} = f system;
    } ) {} supportedSystems;


# ---------------------------------------------------------------------------- #

    nixosModules.default       = nixosModules.flocoPackages;
    nixosModules.flocoPackages = { lib, ... }: {
      imports = [floco.nixosModules.floco];
    };


# ---------------------------------------------------------------------------- #

    overlays.default       = overlays.flocoPackages;
    overlays.flocoPackages = final: prev:
      floco.overlays.default final prev;


# ---------------------------------------------------------------------------- #

  in {

# ---------------------------------------------------------------------------- #

    inherit (floco) lib;

# ---------------------------------------------------------------------------- #

    inherit overlays nixosModules;

# ---------------------------------------------------------------------------- #

    packages = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.${system}.extend overlays.default;
    in {
    } );


# ---------------------------------------------------------------------------- #

  };  # End `outputs'


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
