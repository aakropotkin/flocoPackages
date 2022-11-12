{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@apollo%2freact-components?_rev=39-4ae437800e3a39b706b53b88c7ac142b";
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
    ident = "@apollo/react-components";
    ldir  = "info/apollo/react-components";
    inherit packument fetchInfo;
  } // latest';

}
