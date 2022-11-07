{

  inputs.packument.url   = "https://registry.npmjs.org/copy-webpack-plugin?rev=141-58cde1346041bb2eef0e1832d4c39559";
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
    ident = "copy-webpack-plugin";
    ldir  = "info/unscoped/c/copy-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
