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
  # FIXME: probably don't hard-code version.
  nmDirCmd = ''
    pjsAddMod ${flocoPackages."isexe/2.0.0"} "$node_modules_path/isexe";
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
