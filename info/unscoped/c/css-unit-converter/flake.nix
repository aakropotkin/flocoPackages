{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/css-unit-converter?_rev=7-6b0d5ecfb7924ccf79c07510a7990b6f";
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
    ident = "css-unit-converter";
    ldir  = "info/unscoped/c/css-unit-converter";
    inherit packument fetchInfo;
  } // latest';

}
