{ lib
, ident
, version
, stdenv
, src
, pjsUtil
, installGlobalNodeModuleHook
, patchNodePackageHook
}: stdenv.mkDerivation {
  name = "${baseNameOf ident}-${version}";
  inherit version;
  inherit src;
  nativeBuildInputs = [
    pjsUtil
    patchNodePackageHook
    installGlobalNodeModuleHook
  ];
  outputs       = ["out" "global"];
  dontBuild     = true;
  dontConfigure = true;
  installPhase  = lib.withHooks "install" ''
    pjsAddMod . "$out";
  '';
  dontStrip = true;
}
