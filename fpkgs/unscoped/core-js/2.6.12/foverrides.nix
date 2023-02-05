{ lib, ... }: {
  config.floco.pdefs.core-js."2.6.12".lifecycle.install = lib.mkForce false;
}
