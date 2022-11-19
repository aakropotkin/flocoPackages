{ lib }: let
  lockVInfo = import ./lockVINfo.nix;
  metaEntFromVInfo = { name, version, ... } @ vinfo: let
    fetche = lockVInfo vinfo;
    info = vinfo // si // {
      entFromtype = "vinfo";
      ident = name;
      key   = "${name}/${version}";
      inherit (fetched) fetchInfo;
    };
  in lib.libmeta.metaEntFromSerial info;
in metaEntFromVInfo
