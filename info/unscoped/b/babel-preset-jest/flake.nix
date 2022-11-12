{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-preset-jest?_rev=292-fc9e05bd80ce6d6794cc3ed8ad16bbb1";
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
    ident = "babel-preset-jest";
    ldir  = "info/unscoped/b/babel-preset-jest";
    inherit packument fetchInfo;
  } // latest';

}
