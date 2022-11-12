{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/es6-shim?_rev=196-8790c43f4d1f162875ff4342c6bb3def";
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
    ident = "es6-shim";
    ldir  = "info/unscoped/e/es6-shim";
    inherit packument fetchInfo;
  } // latest';

}
