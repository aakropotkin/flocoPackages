{ ident , version, mkBinPackage, src, flocoPackages }: mkBinPackage {
  inherit ident version src;
  globalNmDirCmd = ''
    pjsAddMod ${flocoPackages."argparse/2.0.1"} "$node_modules_path/argparse";
  '';
}
