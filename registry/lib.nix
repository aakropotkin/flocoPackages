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
    ldir = if scope == "unscoped" then "unscoped" else "@${scope}";
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
      proc = acc: { from, to, sourceInfo ? {} } @ tree: let
        base  = if to.type == "indirect" then self."${asId to}" else to;
        value = base // sourceInfo;
      in acc // { "${asId from}" = value; };
    in builtins.foldl' proc {} ( lib.readTreelockFor scope bname ).trees;
  in self;


# ---------------------------------------------------------------------------- #

  # Fill missing `sourceInfo' fields in treelock.
  addSourceInfoToTreelock = tlock:
    tlock // {
      trees = map ( { from, to, ... } @ ent:
        if ent ? sourceInfo then ent else ent // {
          sourceInfo = removeAttrs ( builtins.fetchTree to ) ["outPath"];
        } ) tlock.trees;
    };

  # Fill missing `sourceInfo' fields for a set of treelocks.
  addSourceInfoToTreelocks = builtins.mapAttrs ( _: addSourceInfoToTreelock );


# ---------------------------------------------------------------------------- #

in lib


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
