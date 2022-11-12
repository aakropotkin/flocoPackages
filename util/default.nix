{ nixpkgs     ? builtins.getFlake "nixpkgs"
, at-node-nix ? builtins.getFlake "github:aameen-tulip/at-node-nix"
, lib         ? at-node-nix.lib
, system      ? builtins.currentSystem
, pkgsFor     ? nixpkgs.legacyPackages.${system}
}: let
  self = {

    checkPermsDrv = let
      auto = { inherit (pkgsFor) runCommandNoCC; };
    in args: ( import ./checkPerms.nix ) ( auto // args );

    checkPerms = { ident, version }: let
      rsl  = self.checkPermsDrv { inherit ident version; };
    in ( lib.fileContents rsl.outPath ) == "PASS";

    genFetchInfo = {
      ident     ? packument._id
    , packument ? lib.importJSON ( builtins.fetchTree {
        type = "file"; url = "https://registry.npmjs.org/${ident}";
      } )
    , dir ? "${toString ../.}/info/" + (
        if lib.test "@.*" ident then lib.yank "@(.*)" ident else
        "unscoped/${lib.toLower (builtins.substring 0 1 ident)}/${ident}"
      )
     
    } @ args: import ./genFetchInfo.nix {
      inherit lib packument dir;
      inherit (self) checkPerms;
    };

  };
in self
