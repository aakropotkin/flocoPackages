{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/micromark-factory-label?_rev=8-c6aac778dcedb6b2fb3b6f5082c123a1";
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
    ident = "micromark-factory-label";
    ldir  = "info/unscoped/m/micromark-factory-label";
    inherit packument fetchInfo;
  } // latest';

}
