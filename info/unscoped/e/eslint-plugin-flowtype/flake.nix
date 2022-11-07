{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-flowtype?rev=210-b4e2d92b30b16bf2b6f1677e68269300";
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
    ident = "eslint-plugin-flowtype";
    ldir  = "info/unscoped/e/eslint-plugin-flowtype";
    inherit packument fetchInfo;
  } // latest';

}
