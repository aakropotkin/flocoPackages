{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-react-display-name?rev=75-f3e448239f93eb5f1566a11611a0e430";
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
    ident = "babel-plugin-transform-react-display-name";
    ldir  = "info/unscoped/b/babel-plugin-transform-react-display-name";
    inherit packument fetchInfo;
  } // latest';

}
