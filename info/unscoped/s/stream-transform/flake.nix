{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stream-transform?_rev=53-b4c1c1f968dba2bdf4631214766cc056";
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
    ident = "stream-transform";
    ldir  = "info/unscoped/s/stream-transform";
    inherit packument fetchInfo;
  } // latest';

}
