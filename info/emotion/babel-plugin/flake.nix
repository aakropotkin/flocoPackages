{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@emotion%2fbabel-plugin?_rev=21-a703d4880031854330a0f70b8c4f31e5";
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
    scope = "@emotion";
    ident = "@emotion/babel-plugin";
    ldir  = "info/emotion/babel-plugin";
    inherit packument fetchInfo;
  } // latest';

}
