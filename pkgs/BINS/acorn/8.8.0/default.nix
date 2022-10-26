{ lib
, ident
, version
, stdenv
, src
, pjsUtil
, nodejs
}: stdenv.mkDerivation {
  name = "${baseNameOf ident}-${version}";
  inherit version;
  inherit src;
  nativeBuildInputs = [pjsUtil];
  buildInputs = [nodejs];
  outputs = ["out" "global"];
  dontBuild     = true;
  dontConfigure = true;
  installPhase = lib.withHooks "install" ''
    pjsSetBinPerms;
    pjsPatchNodeShebangs;
    cp -pr --reflink=auto . "$out";
    mkdir -p "$global/lib/node_modules/${dirOf ident}" "$global/bin";
    cp -pr --reflink=auto . "$global/lib/node_modules/${ident}";
    ln -sr "$global/lib/node_modules/${ident}/bin/acorn" "$global/bin/acorn";
  '';
  dontStrip = true;
}
