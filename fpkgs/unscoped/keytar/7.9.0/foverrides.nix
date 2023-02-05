{ lib, ... }: {
  config.floco.pdefs.keytar."7.9.0".lifecycle.install = lib.mkForce false;
}
