{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/boolbase?_rev=4-1326bf7f9caccc67f78738ed0a9edb8c";
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
    ident = "boolbase";
    ldir  = "info/unscoped/b/boolbase";
    inherit packument fetchInfo;
  } // latest';

}
