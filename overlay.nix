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

  flocoPackages = prev.lib.addFlocoPackages prev ( fpSelf: let
    # FIXME: this should carry the helpers that the lower level overlays have
    # in common.
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
  } );  # End flocoPackages

} # End `pkgs' overlay
