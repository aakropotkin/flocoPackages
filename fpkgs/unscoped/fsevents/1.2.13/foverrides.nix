{ config, pkgs, ... }: let
  cfg = config.floco.pdefs.fsevents."1.2.13";
in {
  config.floco.packages.fsevents."1.2.13".installed.extraBuildInputs = [
    pkgs.patchelf
  ] ++ ( if ! pkgs.stdenv.hostPlatform.isDarwin then [] else [
    pkgs.darwin.apple_sdk.frameworks.CoreServices
  ] );
}
