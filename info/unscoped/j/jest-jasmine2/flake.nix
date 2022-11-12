{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-jasmine2?_rev=430-b6906ee34104ca2af405a7799e94dab3";
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
    ident = "jest-jasmine2";
    ldir  = "info/unscoped/j/jest-jasmine2";
    inherit packument fetchInfo;
  } // latest';

}
