{ lib
, ident
, version
, evalScripts
, src
#, nmDirCmd
}: evalScripts {
  name = "${baseNameOf ident}-${version}";
  inherit version;
  inherit src;
  #inherit nmDirCmd;
  nmDirCmd = let
    isexe = builtins.fetchTree {
      type = "tarball";
      url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
      narHash = "sha256-l3Fv+HpHS6H1TqfC1WSGjsGlX08oDHyHdsEu9JQkvhE=";
    };
  in ''
    pjsAddMod ${isexe} "$node_modules_path/isexe";
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
