{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@typescript-eslint/visitor-keys?_rev=1651-d3f4c00f1bf757f495788c9239e870df";
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
    scope = "@typescript-eslint";
    ident = "@typescript-eslint/visitor-keys";
    ldir  = "info/typescript-eslint/visitor-keys";
    inherit packument fetchInfo;
  } // latest';

}
