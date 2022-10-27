{ lib }: let
  manifestToLock = import ./manifestToLock.nix;
  metaEntFromManifest = { name, version, ... } @ manifest: let
    si = manifestToLock manifest;
    info = manifest // si // {
      # FIXME: add manifest as recognized type
      #entFromtype = "manifest";
      ident = name;
      key   = "${name}/${version}";
      # FIXME: metaEnt sourceInfo needs to be renamed.
      sourceInfo = si.sourceInfo // si.fetchInfo;
    };
  in lib.libmeta.metaEntFromSerial info;
in metaEntFromManifest
