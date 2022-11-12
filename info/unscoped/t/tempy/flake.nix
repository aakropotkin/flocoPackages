{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tempy?_rev=24-50e4e2f71d9cc3bf51d3f17042e5be1d";
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
    ident = "tempy";
    ldir  = "info/unscoped/t/tempy";
    inherit packument fetchInfo;
  } // latest';

}
