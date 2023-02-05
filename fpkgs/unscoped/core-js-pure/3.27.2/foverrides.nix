{ lib, ... }: {
  config.floco.pdefs.core-js-pure."3.27.2".lifecycle.install =
    lib.mkForce false;
}
