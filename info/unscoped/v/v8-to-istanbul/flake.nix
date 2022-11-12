{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/v8-to-istanbul?_rev=52-4aef8172430c4b846b90a07f7220ea02";
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
    ident = "v8-to-istanbul";
    ldir  = "info/unscoped/v/v8-to-istanbul";
    inherit packument fetchInfo;
  } // latest';

}
