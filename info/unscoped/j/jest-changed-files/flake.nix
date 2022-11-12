{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-changed-files?_rev=262-6fdcb06b8e93b09f9948e10b6bf468f2";
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
    ident = "jest-changed-files";
    ldir  = "info/unscoped/j/jest-changed-files";
    inherit packument fetchInfo;
  } // latest';

}
