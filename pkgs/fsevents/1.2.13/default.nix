
# XXX: Only builds for Darwin.
# This ships with pre-built Linux libs.
{ lib
, fsevents-src ? builtins.fetchTree {
    type    = "tarball";
    url     = "https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz";
    narHash = "sha256-prK0V63HoVHzoQrTB6MzYEloOwBo5qvSnYVUrg9SFE8=";
  }
, stdenv
, copyOut
, buildGyp      # at-node-nix.buildGyp
, CoreServices  # darwin.apple_sdk.frameworks.CoreServices
, nan           ? flocoPackages.nan
, flocoPackages ? {}
, meta          ? {}
}: if ! stdenv.isDarwin then copyOut { src = fsevents-src; } else buildGyp {
  name     = "fsevents-1.2.13";
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
