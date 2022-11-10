{ nixpkgs ? builtins.getFlake "nixpkgs"
, lib     ? nixpkgs.lib
, system  ? builtins.currentSystem
, pkgsFor ? nixpkgs.legacyPackages.${system}
}: let
  self = {
    checkPermsDrv = let
      auto = { inherit (pkgsFor) runCommandNoCC; };
    in args: ( import ./checkPerms.nix ) ( auto // args );
    checkPerms = { ident, version }: let
      rsl  = self.checkPermsDrv { inherit ident version; };
    in ( lib.fileContents rsl.outPath ) == "PASS";
  };
in self
