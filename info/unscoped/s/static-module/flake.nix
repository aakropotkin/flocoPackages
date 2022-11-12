{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/static-module?_rev=70-f00b8d91da7c5f1513bc541101d52a2e";
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
    ident = "static-module";
    ldir  = "info/unscoped/s/static-module";
    inherit packument fetchInfo;
  } // latest';

}
