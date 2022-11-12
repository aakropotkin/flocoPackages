{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-static?_rev=119-02a315f019f835ae0a92e89e488f2e4d";
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
    ident = "node-static";
    ldir  = "info/unscoped/n/node-static";
    inherit packument fetchInfo;
  } // latest';

}
