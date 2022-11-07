{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-react-constant-elements?rev=89-2e2d4272f55fbd106c6f5eab1ae51801";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-react-constant-elements";
    ldir  = "info/babel/plugin-transform-react-constant-elements";
    inherit packument fetchInfo;
  } // latest';

}
