{

  inputs.packument.url   = "https://registry.npmjs.org/@apollo/react-ssr?rev=26-a45086ab0359cb4cfebf5fb7f7a8f468";
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
    ident = "@apollo/react-ssr";
    ldir  = "info/apollo/react-ssr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
