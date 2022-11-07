{

  inputs.packument.url   = "https://registry.npmjs.org/@pmmmwh/react-refresh-webpack-plugin?rev=80-d48940aa979ed75a9f27babe0c28a0a6";
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
    scope = "@pmmmwh";
    ident = "@pmmmwh/react-refresh-webpack-plugin";
    ldir  = "info/pmmmwh/react-refresh-webpack-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
