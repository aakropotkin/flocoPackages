{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/eslint-plugin-react-hooks?_rev=1121-524212680a0af181cc7f6499191d51ae";
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
    ident = "eslint-plugin-react-hooks";
    ldir  = "info/unscoped/e/eslint-plugin-react-hooks";
    inherit packument fetchInfo;
  } // latest';

}
