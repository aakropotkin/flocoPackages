{
  description = "generates treelock registries from packuments";

  inputs.at-node-nix.url = "github:aameen-tulip/at-node-nix";
  inputs.nixpkgs.follows = "/at-node-nix/nixpkgs";

  # @INPUTS@


# ---------------------------------------------------------------------------- #

  outputs = { self, at-node-nix, ... } @ inputs: let

# ---------------------------------------------------------------------------- #

    inherit (at-node-nix) lib;

# ---------------------------------------------------------------------------- #

    explodeName = x: let
      ident = x.name or (
        if builtins.isString x then x else
        if x ? key then ( dirOf x.key ) else assert x ? scope;
        if builtins.elem x.scope [null "" "unscoped" "UNSCOPED" "."]
        then x.bname else "@${x.scope}/${x.bname}"
      );
      parsed = lib.libparse.parseIdent ident;
      scope = let
        s = x.scope or ( dirOf ident );
      in if builtins.elem s [null "" "." "unscoped" "UNSCOPED"] then null else
          lib.yank "@?([^@/]+)/?" s;
    in {
      inherit ident scope;
      inherit (parsed) bname;
      ldir = if scope == null then "unscoped" else "@${scope}";
    };


    mkTreeLock = {
      __functionArgs = {
        ident       = false;
        type        = true;
        existing    = true;
        versionCond = true;
      };
      __innerFunction = lib.libreg.flakeRegistryFromPackuments;
      __thunk = {
        registry          = "https://registry.npmjs.org";
        treelock          = true;
        minimizeFetchInfo = true;
      };
      __processArgs = self: x: let
        nattrs   = explodeName x;
        lpath    = "${toString ./.}/${nattrs.ldir}/${nattrs.bname}";
        existing' = if ! ( builtins.pathExists lpath ) then {} else {
          existing = lib.importJSON lpath;
        };
        x' = if builtins.isAttrs x then x else {};
        args = self.__thunk // existing' // x' // nattrs;
      in lib.canPassStrict self.__innerFunction args;
      __functor = self: x:
        self.__innerFunction ( self.__processArgs self x );
    };


# ---------------------------------------------------------------------------- #

    mkTreeLockJSON = {
      inherit (mkTreeLock) __functionArgs;
      __functor = self: x: builtins.toJSON ( mkTreeLock x );
    };

    pkglist = lib.importJSON ./npmjs.json;
    tlocks  = let
      proc = acc: scope: acc // {
        ${scope} = builtins.foldl' ( bs: bname:
          bs // { "${bname}.json" = mkTreeLockJSON { inherit scope bname; }; }
        ) {} pkglist.${scope};
      };
    in builtins.foldl' proc {} ( builtins.attrNames pkglist );


# ---------------------------------------------------------------------------- #

  in {

    inherit lib explodeName;
    
    inherit mkTreeLock tlocks pkglist;

  };  # End Outputs


# ---------------------------------------------------------------------------- #

}
