{ config, pkgs, ... }: let
  cfg = config.floco.pdefs.zeromq."5.3.1";
in {
  config.floco.pdefs.zeromq."5.3.1".treeInfo = {
    "node_modules/nan" = {
      key = "nan/${cfg.depInfo.nan.pin}";
    };
    "node_modules/node-gyp-build" = {
      key = "node-gyp-build/${cfg.depInfo.node-gyp-build.pin}";
    };
  };
  config.floco.packages.zeromq."5.3.1".installed.extraBuildInputs = [
    pkgs.patchelf
  ];
}
