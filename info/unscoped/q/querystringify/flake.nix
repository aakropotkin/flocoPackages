{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/querystringify?_rev=34-fc6170840a571b2b9f4c6eef2c3b45e9";
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
    ident = "querystringify";
    ldir  = "info/unscoped/q/querystringify";
    inherit packument fetchInfo;
  } // latest';

}
