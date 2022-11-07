{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-react-jsx-self?rev=81-fa1db52ba870d1cc9c71faa803591fd5";
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
    ident = "@babel/plugin-transform-react-jsx-self";
    ldir  = "info/babel/plugin-transform-react-jsx-self";
    inherit packument fetchInfo;
  } // latest';

}
