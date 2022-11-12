{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/es6-promisify?_rev=58-e2ef0fddcef1023dfa9228851be33270";
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
    ident = "es6-promisify";
    ldir  = "info/unscoped/e/es6-promisify";
    inherit packument fetchInfo;
  } // latest';

}
