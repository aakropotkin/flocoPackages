
# XXX: Only builds for Darwin.
# This ships with pre-built Linux libs.
{ lib
, src ? builtins.fetchTree {
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
}: if ! stdenv.isDarwin then copyOut { inherit src; } else buildGyp {
  name     = "fsevents-1.2.13";
  version  = "1.2.13";
  inherit src;
  nmDirCmd = ''
    pjsAddMod ${nan} "$node_modules_path/nan";
  '';
  buildInputs = [CoreServices];
  inherit meta;
}
