{ ident, version, mkBinPackage, src, flocoPackages }: mkBinPackage {
  inherit ident version src;
  # FIXME: probably don't hard-code version.
  globalNmDirCmd = ''
    pjsAddMod ${flocoPackages."isexe/2.0.0"} "$node_modules_path/isexe";
  '';
}
