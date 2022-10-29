{ lib
, ident
, version
, evalScripts
, src
, nmDirCmd ? ":"
}: evalScripts {
  name = "${baseNameOf ident}-${version}";
  inherit version;
  inherit src nmDirCmd;
  runScripts    = [];
  globalInstall = true;
  postUnpack    = ":";
  dontBuild     = true;
  dontConfigure = true;
  installPhase  = lib.withHooks "install" ''
    pjsAddMod . "$out";
  '';
}
