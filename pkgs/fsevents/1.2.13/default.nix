
# XXX: Only builds for Darwin.
# This ships with pre-built Linux libs.

{ fsevents-src
, stdenv
, copyOut
, buildGyp      # at-node-nix.buildGyp
, CoreServices  # darwin.apple_sdk.frameworks.CoreServices
, nan           ? flocoPackages.nan
, flocoPackages ? {}
, meta          ? {}
}: if ! stdenv.isDarwin then copyOut { src = fsevents-src; } else buildGyp {
  name     = "fsevents-inst-1.2.13";
  version  = "1.2.13";
  src      = fsevents-src;
  nmDirCmd = ''
    mkdir -p "$node_modules_path";
    cp -pr --reflink=auto -- ${nan} "$node_modules_path/nan";
    chmod -R +w "$node_modules_path";
  '';
  buildInputs = [CoreServices];
  inherit meta;
}
