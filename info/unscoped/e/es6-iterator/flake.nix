{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/es6-iterator?_rev=19-b7f16afae79d1adfa70feeee4a0f1fc1";
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
    ident = "es6-iterator";
    ldir  = "info/unscoped/e/es6-iterator";
    inherit packument fetchInfo;
  } // latest';

}
