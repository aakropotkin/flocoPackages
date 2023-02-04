{ config, ... }: {
  config.floco.packages.msgpackr-extract."2.2.0".installed = {
    extraNativeBuildInputs = [
      config.floco.packages.node-gyp-build-optional-packages."5.0.3".global
    ];
  };
}
