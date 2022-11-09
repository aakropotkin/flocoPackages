{ lib
, ident
, version
, evalScripts
, src
, globalNmDirCmd ? ":"
}: evalScripts {
  name = "${baseNameOf ident}-${version}";
  inherit ident version;
  inherit src globalNmDirCmd;
  runScripts    = [];
  globalInstall = true;
  postUnpack    = ":";
  dontBuild     = true;
  dontConfigure = true;
}
