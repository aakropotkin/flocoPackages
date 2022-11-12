{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/electron?_rev=1631-78ff8202cdd6b7eaedac46bd64322266";
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
    ident = "electron";
    ldir  = "info/unscoped/e/electron";
    inherit packument fetchInfo;
  } // latest';

}
