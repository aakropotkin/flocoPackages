final: prev: let

  ents = builtins.foldl' ( acc: ent: acc // {
    ${ent.ident} = final.flocoPackages."${ent.ident}/${ent.version}";
    # FIXME: `flocoFetch'
    "${ent.ident}/${ent.version}" =
      if ent.sourceInfo.type == "file"
      then ( prev.unpackSafe or final.unpackSafe ) {
        name        = "${baseNameOf ent.ident}-src-${ent.version}";
        src         = builtins.fetchTree ent.sourceInfo;
        setBinPerms = false;
      } else ent // {
        inherit (builtins.fetchTree ent.sourceInfo) outPath;
      };
  } ) {} ( prev.lib.importJSON ./locked.json );

in {
  flocoPackages = prev.lib.addFlocoPackages prev ents;
}
