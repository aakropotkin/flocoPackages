
# XXX: Only builds for Darwin.
# This ships with pre-built Linux libs.
{ lib      # nixpkgs#lib  ( or extension )
, ident    ? ( lib.importJSON "${src}/package.json" ).name
, version  ? ( lib.importJSON "${src}/package.json" ).version
, src ? builtins.fetchTree {
    type    = "tarball";
    url     = "https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz";
    narHash = "sha256-prK0V63HoVHzoQrTB6MzYEloOwBo5qvSnYVUrg9SFE8=";
  }
, stdenv        # nixpkgs#stdenv
, copyOut       # ak-nix#copyOut
, buildGyp      # at-node-nix#buildGyp
, CoreServices  # nixpkgs#darwin.apple_sdk.frameworks.CoreServices
, nan           ? flocoPackages."nan/2.16.0"
, flocoPackages ? {}
, meta          ? { inherit ident version; key = "${ident}/${version}"; }
}: if ! stdenv.isDarwin then copyOut { inherit src; } else buildGyp {
  name     = "${baseNameOf ident}-${version}";
  inherit src version ident;
  nmDirCmd = ''
    pjsAddMod ${nan} "$node_modules_path/nan";
  '';
  buildInputs = [CoreServices];
  inherit meta;
}
