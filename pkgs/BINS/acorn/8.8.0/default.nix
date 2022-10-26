{ lib
, ident
, version
, stdenv
, src
, pjsUtil
, installGlobalNodeModuleHook
, patchNodePackageHook
, nodejs
}: stdenv.mkDerivation {
  name = "${baseNameOf ident}-${version}";
  inherit version;
  inherit src;
  nativeBuildInputs = [
    pjsUtil
    patchNodePackageHook
    installGlobalNodeModuleHook
  ];
  buildInputs   = [nodejs];
  outputs       = ["out" "global"];
  dontBuild     = true;
  dontConfigure = true;
  installPhase  = lib.withHooks "install" ''
    pjsAddMod . "$out";
  '';
  dontStrip = true;
}
