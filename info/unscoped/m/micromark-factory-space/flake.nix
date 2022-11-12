{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/micromark-factory-space?_rev=5-858413532be5598170083812a5921b64";
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
    ident = "micromark-factory-space";
    ldir  = "info/unscoped/m/micromark-factory-space";
    inherit packument fetchInfo;
  } // latest';

}
