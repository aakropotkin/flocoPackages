final: prev: let

  ents = builtins.foldl' ( acc: ent: acc // {
    ${ent.ident} = final.flocoPackages."${ent.ident}/${ent.version}";
    "${ent.ident}/${ent.version}" =
      if ent.sourceInfo.type == "file"
      then final.flocoUnpack {
        name        = "${baseNameOf ent.ident}-src-${ent.version}";
        tarball     = final.flocoFetch ent.sourceInfo;
        setBinPerms = false;
      } else ent // {
        inherit (final.flocoFetch ent.sourceInfo) outPath;
      };
  } ) {} ( prev.lib.importJSON ./locked.json );

in {
  flocoPackages = final.lib.addFlocoPackages prev ents;
}
