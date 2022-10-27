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
    pjsAddMod ${flocoPackages."js-tokens/4.0.0"} $node_modules_path/js-tokens;
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
