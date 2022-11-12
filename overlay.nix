# Nixpkgs overlay: Builders, Packages, Overrides, etc.
final: prev: let
  callPackagesWith = auto: prev.lib.callPackagesWith ( final // auto );
  callPackageWith  = auto: prev.lib.callPackageWith ( final // auto );
  callPackages     = callPackagesWith {};
  callPackage      = callPackageWith {};
  nixpkgsConfig    = prev.lib.importJSON ./config/nixpkgsConfig.json;
in {

  # Disables `checkMeta'
  config = prev.lib.recursiveUpdate prev.config nixpkgsConfig;
  lib    = prev.lib.extend ( import ./lib/overlay.lib.nix );

  flocoPackages = prev.lib.makeExtensible ( fpSelf: let
    callFlocoPackage = prev.lib.callPackageWith {
      inherit (final)
        stdenv lib copyOut buildGyp darwin
      ;
      inherit (final.darwin.apple_sdk.frameworks)
        CoreServices
      ;
      flocoPackages = fpSelf;
    };
  in {
    "fsevents/1.2.13" = callFlocoPackage ./pkgs/fsevents/1.2.13 {
      src = builtins.fetchTree {
        type = "tarball";
        url = "https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz";
        narHash = "sha256-prK0V63HoVHzoQrTB6MzYEloOwBo5qvSnYVUrg9SFE8=";
      };
    };
  } );  # End flocoPackages

} # End `pkgs' overlay
