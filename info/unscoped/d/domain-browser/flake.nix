{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/domain-browser?_rev=89-ec4f72ccb659a600f07c63d607dafdd5";
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
    ident = "domain-browser";
    ldir  = "info/unscoped/d/domain-browser";
    inherit packument fetchInfo;
  } // latest';

}
