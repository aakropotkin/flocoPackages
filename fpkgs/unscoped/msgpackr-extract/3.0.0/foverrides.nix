{ config, ... }: {
  config.floco.packages.msgpackr-extract."3.0.0".installed = {
    extraNativeBuildInputs = [
      config.floco.packages.node-gyp-build-optional-packages."5.0.7".global
    ];
  };
}
