{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/deep-assign?_rev=22-9d31c0f9a806eee931f25c996ffd464a";
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
    ident = "deep-assign";
    ldir  = "info/unscoped/d/deep-assign";
    inherit packument fetchInfo;
  } // latest';

}
