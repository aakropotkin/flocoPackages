{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/es-array-method-boxes-properly?_rev=1-a92c835260f5a6db56ddeeba519af85b";
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
    ident = "es-array-method-boxes-properly";
    ldir  = "info/unscoped/e/es-array-method-boxes-properly";
    inherit packument fetchInfo;
  } // latest';

}
