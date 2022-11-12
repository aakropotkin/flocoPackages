{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-image?_rev=63-99491ce4bf01b7146b0ead0f11dd1db0";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "rc-image";
    ldir  = "info/unscoped/r/rc-image";
    inherit packument fetchInfo;
  } // latest';

}
