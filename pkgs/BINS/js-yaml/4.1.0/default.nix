{ lib
, ident
, version
, evalScripts
, src
, flocoPackages
}: evalScripts {
  name = "${baseNameOf ident}-${version}";
  inherit version;
  inherit src;
  nmDirCmd = ''
    pjsAddMod ${flocoPackages."argparse/2.0.1"} "$node_modules_path/argparse";
  '';
  runScripts    = [];
  globalInstall = true;
  postUnpack    = ":";
  dontBuild     = true;
  dontConfigure = true;
  installPhase  = lib.withHooks "install" ''
    pjsAddMod . "$out";
  '';
}
