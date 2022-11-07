{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-react-jsx-source?rev=79-22cb7d867fef4e6a1f5648907cdc047e";
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
    ident = "babel-plugin-transform-react-jsx-source";
    ldir  = "info/unscoped/b/babel-plugin-transform-react-jsx-source";
    inherit packument fetchInfo;
  } // latest';

}
