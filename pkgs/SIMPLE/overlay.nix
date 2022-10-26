# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

  # A miniature `lib' for using treelock registries.
  rlib = import ../../registry/lib.nix;

  lockedEnts = builtins.foldl' ( acc: ent: acc // {
    ${ent.ident} = final.flocoPackages."${ent.ident}/${ent.version}";
    "${ent.ident}/${ent.version}" = final.flocoSimpleFetcher ent;
  } ) {} ( prev.lib.importJSON ./locked.json );

  # Fills all past versions for any locked packages.
  # NOTE: excludes "*--latest" trees.
  regEnts = let
    idents = prev.lib.unique ( map ( { ident, scope, ... }: {
      inherit ident scope;
    } ) ( prev.lib.importJSON ./locked.json ) );
    idsProc = acc: si: let
      trees = rlib.lookup si.ident;
      filt  = k: v:
        ( ! ( prev.lib.hasSuffix "--latest" k ) ) && ( v ? narHash );
      keeps = prev.lib.filterAttrs filt trees;
      treesProc = tacc: k: let
        key = rlib.lockIdToKey k;
      in tacc // {
        ${key} = final.flocoSimpleFetcher {
          ident   = dirOf key;
          version = baseNameOf key;
          sourceInfo = keeps.${k};
        };
      };
    in acc // ( builtins.foldl' treesProc {} ( builtins.attrNames keeps ) );
  in builtins.foldl' idsProc {} idents;

  ents = prev.lib.recursiveUpdate regEnts lockedEnts;

in {

  # Produces store paths from `./locked.json' tree entries.
  # In the case of `type = "file"' entries we produce a derivation of the
  # unpacked tarball; for `type = "tarball"' entries we just produce storepaths.
  flocoSimpleFetcher = { sourceInfo, ... } @ ent: let
    fetched  = builtins.fetchTree sourceInfo;
    unpacked = final.flocoUnpack {
      name        = "source";
      tarball     = fetched;
      setBinPerms = false;   # None of these have bins.
    };
    src = if sourceInfo.type == "file" then unpacked else fetched;
  in ent // src;

  flocoPackages = final.lib.addFlocoPackages prev ents;

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
