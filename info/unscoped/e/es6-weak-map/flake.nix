{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/es6-weak-map?_rev=23-af3c468eadc15f41b640a18e55ac594f";
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
    ident = "es6-weak-map";
    ldir  = "info/unscoped/e/es6-weak-map";
    inherit packument fetchInfo;
  } // latest';

}
