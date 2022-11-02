# ============================================================================ #
#
# A minimal lib for reading treelocks.
#
# ---------------------------------------------------------------------------- #

let

# ---------------------------------------------------------------------------- #

  lib.importJSON = f: builtins.fromJSON ( builtins.readFile f );


# ---------------------------------------------------------------------------- #

  lib.readTreelockFor = scope: bname: let
    ldir = if builtins.elem scope [null "unscoped" ""] then "unscoped"
                                                       else "@${scope}";
  in lib.importJSON "${toString ./.}/${ldir}/${bname}.json";

  lib.readTreelocksForScope = scope: bnames:
    builtins.listToAttrs ( map ( name: {
      inherit name;
      value = lib.readTreelockFor scope name;
    } ) bnames );


# ---------------------------------------------------------------------------- #

  # Reads a treelock into attrs similar to those seen in a `flake.lock'.
  #   [{ from.id = "foo"; to = { type = "tarball"; url = "..."; } }]
  #   =>
  #   { foo = { type = "tarball"; url = "..."; }; }
  lib.treelockToAttrs = scope: bname: let
    self = let
      asId = { id, ref ? null, ... }:
        if ref == null then id else "${id}/${ref}";
      proc = acc: { from, to, fetchInfo ? {} } @ tree: let
        base  = if to.type == "indirect" then self."${asId to}" else to;
        value = base // fetchInfo;
      in acc // { "${asId from}" = value; };
    in builtins.foldl' proc {} ( lib.readTreelockFor scope bname ).trees;
  in self;


# ---------------------------------------------------------------------------- #

  # Fill missing `fetchInfo' fields in treelock.
  addFetchInfoToTreelock = tlock:
    tlock // {
      trees = map ( { from, to, ... } @ ent:
        if ent ? fetchInfo then ent else ent // {
          fetchInfo = removeAttrs ( builtins.fetchTree to ) ["outPath"];
        } ) tlock.trees;
    };

  # Fill missing `fetchInfo' fields for a set of treelocks.
  addFetchInfoToTreelocks = builtins.mapAttrs ( _: addFetchInfoToTreelock );


# ---------------------------------------------------------------------------- #

  # Lookup a treelock by package name, returning the lock represented as attrs.
  #   lib.lookup "chai" => { chai--0_0_1 = { ... }; chai--0_0_2 = { ... }; ... }
  #   lib.lookup { scope = "unscoped"; bname = "chai"; }
  #   => { chai--0_0_1 = { ... }; chai--0_0_2 = { ... }; ... }
  lib.lookup = {
    __functionArgs  = { scope = true; bname = false; };
    __innerFunction = self: { scope, bname }: lib.treelockToAttrs scope bname;
    __processArgs = x: let
      m = builtins.match "(@([^@/]+)/)?([^@/]+)" x;
      scope = let
        s = builtins.elemAt m 1;
      in if s == null then "unscoped" else s;
      bname = builtins.elemAt m 2;
    in if builtins.isString x then { inherit scope bname; } else x;
    __functor = self: x: self.__innerFunction self ( self.__processArgs x );
  };


# ---------------------------------------------------------------------------- #

  # Convert a lockfile id to package key as used by `metaSet' records.
  lib.lockIdToKey = lid: let
    forScoped = let
      m  = builtins.match "(.*)--(.*)--(.*)" lid;
      sd = if ( builtins.head m ) == "unscoped" then ""
                                                else "@${builtins.head m}/";
      v = builtins.replaceStrings ["_"] ["."] ( builtins.elemAt m 2 );
    in if m == null then null else "${sd}${builtins.elemAt m 1}/${v}";
    forUnscoped = let
      m  = builtins.match "(.*)--(.*)" lid;
      v = builtins.replaceStrings ["_"] ["."] ( builtins.elemAt m 1 );
    in "${builtins.head m}/${v}";
  in if forScoped == null then forUnscoped else forScoped;


# ---------------------------------------------------------------------------- #

in lib


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
