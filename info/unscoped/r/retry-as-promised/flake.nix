{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/retry-as-promised?_rev=24-7e412cffec4d5083b690320a2c5a2559";
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
    ident = "retry-as-promised";
    ldir  = "info/unscoped/r/retry-as-promised";
    inherit packument fetchInfo;
  } // latest';

}
