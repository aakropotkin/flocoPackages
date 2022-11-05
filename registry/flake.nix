{
  description = "generates treelock registries from packuments";

  inputs.at-node-nix.url = "github:aameen-tulip/at-node-nix";
  inputs.nixpkgs.follows = "/at-node-nix/nixpkgs";

  # @INPUTS@


# ---------------------------------------------------------------------------- #

  outputs = { self, at-node-nix, ... } @ inputs: let

# ---------------------------------------------------------------------------- #

    inherit (at-node-nix) lib;

    # The list of packages we try to lock by default.
    # This was originally made from the top 1000 packages + their deps.
    pkglist = lib.importJSON ./npmjs.json;


# ---------------------------------------------------------------------------- #

    # Get various name/path type fields from a package identifier or its parts.
    # Passing in `ident', `name', `key', or `scope' + `bname' as attrs works.
    # You can also just pass the identifier as a string.
    # => {
    #   ident ::= package identifier/name
    #   scope ::= the scope without a "@" prefix. `null' for unscoped.
    #   bname ::= the basename of an identifier with the scope removed.
    #   ldir  ::= the "local dir" where locks for a scope are placed.
    #             for unscoped packages we use "unscoped", for scoped packages
    #             this is the scope with the "@" prefix ( "@foo" ).
    # }
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


# ---------------------------------------------------------------------------- #

    # Produce a treeLock from packument metadata.
    # This is a wrapper around
    # `at-node-nix#lib.libreg.flakeRegistryFromPackuments' that adds some
    # extra pre/post processing and different defaults.
    mkTreeLock = {
      __functionArgs = {
        ident       = false;
        type        = true;
        existing    = true;
        versionCond = true;
        omitExtra   = true;
      };

      __innerFunction = lib.libreg.flakeRegistryFromPackuments;

      # Default/auto args
      __thunk = {
        registry          = "https://registry.npmjs.org";
        treelock          = true;
        minimizeFetchInfo = true;
      };

      # We include the `packument' so that we can extract dates/rev later.
      __processArgs = self: x: let
        nattrs    = explodeName x;
        lpath     = "${toString ./.}/${nattrs.ldir}/${nattrs.bname}.json";
        pargs     = self.__thunk // x' // nattrs;
        packument = lib.libreg.importFetchPackument pargs;
        existing' = if ! ( builtins.pathExists lpath ) then {} else {
          existing = lib.importJSON lpath;
        };
        x'   = if builtins.isAttrs x then x else {};
        args = self.__thunk // existing' // {
          inherit packument;
        } // x' // nattrs;
      in lib.canPassStrict self.__innerFunction args;

      __functor = self: x: let
        args = self.__processArgs self x;
        # Actual tlock
        result = self.__innerFunction args;
        # Add `rev' and `lastModifiedDate'
        extra = if ( x.omitExtra or false ) then {} else {
          info = {
            rev = args.packument._rev;
            lastModifiedDate = let
              # NPM Style: "2022-10-10T06:14:51.676Z"
              # Nix Style: "20221104195126"  ( lastModifiedDate )
              lm = args.packument.time.modified;
              m = builtins.match "(....)-(..)-(..)T(..):(..):(..)\\..*" lm;
            in builtins.concatStringsSep "" m;
          };
        };
      in result // extra;
    };


# ---------------------------------------------------------------------------- #

    # Helpers for filling package specific arguments.
    # These generally pull declared info from external files and pass them
    # to `mkTreeLock' when a particular package is being processed.


    # Determines if "file" or "tarball" fetching is used.
    # Returns an attrset with `{ type = <TYPE>; }' set, or {} if inconclusive.
    typeFor = { scope, bname }: let
      use-tarball = lib.importJSON ./use-tarball.json;
      uts = use-tarball.${scope} or {};
      fromList = builtins.elem bname uts;
      try = if builtins.isBool uts then uts      else
            if builtins.isList uts then fromList else
            uts.${bname} or null;
    in if try == null then {} else {
      type = if try then "tarball" else "file";
    };


    # Allows package specific version conditionals.
    # For inconclusive use `{}', or `{ versionCond = <PREDICATE>; >' to
    # override the default ( which ignores any version with "pre" tags ).
    # You should write predicates in `./versionConds.nix' which is dedicated
    # for that purpose.
    versionCondFor = { scope, bname }: let
      vconds = import ./versionConds.nix { inherit lib; };
    in if ! ( vconds ? ${scope}.${bname} ) then {} else {
      versionCond = vconds.${scope}.${bname};
    };


# ---------------------------------------------------------------------------- #

    # Maps over all scopes/bnames.
    mkTlocks = {
      post      ? ( tlock: tlock )
    , extraArgs ? {}
    , bkeyFn    ? ( bname: bname )  # Used to name bname attrs
    }: let
      # Allows post processing of lock
      mkTL = args: let
        tlock = mkTreeLock args;
      in post tlock;
      # Maps over each scope
      proc = acc: scope: let
        # Maps over each package in a scope
        bproc = bacc: bname: let
          type'  = typeFor { inherit scope bname; };
          vcond' = versionCondFor { inherit scope bname; };
          args   = { inherit scope bname; } // type' // vcond' // extraArgs;
          key    = bkeyFn bname;
        in bacc // { ${key} = mkTL args; };
      in acc // {
        ${scope} = builtins.foldl' bproc {} pkglist.${scope};
      };
    in builtins.foldl' proc {} ( builtins.attrNames pkglist );


# ---------------------------------------------------------------------------- #

  in {

    inherit lib;
    
    inherit
      explodeName
      mkTreeLock
      mkTlocks
    ;
    
    inherit pkglist;


# ---------------------------------------------------------------------------- #

    # Various locks with different settings/output styles.
    # These are generally exposed for use on the CLI, but may also be
    # referenced by other flakes.


    # Plain treeLock. Uses `type = "file";', but won't wipe out existing
    # entries that used `type = "tarball";'.
    tlocks = mkTlocks {};

    # Forces `type = "tarball";' and replaces old entires that use "file".
    # This will fail if you try it on large pools of packages, but is useful
    # for identifying when new versions can use tarballs.
    tlocksTb = mkTlocks { extraArgs.type = "tarball"; };

    # As above but outputs JSON strings.
    # This is useful for `nix eval --impure --write-to ./tlocks .#tlocksJSON;'
    tlocksJSON = mkTlocks {
      post   = builtins.toJSON;
      bkeyFn = bname: "${bname}.json";  # for `--write-to'
    };
    tlocksTbJSON = mkTlocks {
      post   = builtins.toJSON;
      bkeyFn = bname: "${bname}.json";
      extraArgs.type = "tarball";
    };


# ---------------------------------------------------------------------------- #

  };  # End Outputs


# ---------------------------------------------------------------------------- #

}
