{

  inputs.packument.url   = "https://registry.npmjs.org/last-call-webpack-plugin?rev=10-568005b2211a6a67af5f8480ecfec075";
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
    ident = "last-call-webpack-plugin";
    ldir  = "info/unscoped/l/last-call-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
