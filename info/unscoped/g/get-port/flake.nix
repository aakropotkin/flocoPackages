{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/get-port?_rev=42-dd6a58420a7aab0dc31ab4eb4587b955";
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
    ident = "get-port";
    ldir  = "info/unscoped/g/get-port";
    inherit packument fetchInfo;
  } // latest';

}
