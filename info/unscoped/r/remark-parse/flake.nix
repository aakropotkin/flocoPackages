{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/remark-parse?_rev=56-64b98873e50db2e4ad83954ea7fa7a57";
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
    ident = "remark-parse";
    ldir  = "info/unscoped/r/remark-parse";
    inherit packument fetchInfo;
  } // latest';

}
