# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

  ents = builtins.foldl' ( acc: ent: acc // {
    ${ent.ident} = final.flocoPackages."${ent.ident}/${ent.version}";
    "${ent.ident}/${ent.version}" = final.simpleFetcher ent;
  } ) {} ( prev.lib.importJSON ./locked.json );

in {

  # Produces store paths from `./locked.json' tree entries.
  # In the case of `type = "file"' entries we produce a derivation of the
  # unpacked tarball; for `type = "tarball"' entries we just produce storepaths.
  simpleFetcher = { sourceInfo, ... } @ ent: let
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
