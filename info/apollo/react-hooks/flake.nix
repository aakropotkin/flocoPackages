{

  inputs.packument.url   = "https://registry.npmjs.org/@apollo/react-hooks?rev=45-dc34ebbfa06e562bdd61d89e288e45af";
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
    scope = "@apollo";
    ident = "@apollo/react-hooks";
    ldir  = "info/apollo/react-hooks";
    inherit packument fetchInfo;
  } // latest';

}
