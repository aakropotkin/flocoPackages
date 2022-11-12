{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@apollo%2freact-common?_rev=36-89e13e1b6c2d9680b843602367bf9ee8";
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
    ident = "@apollo/react-common";
    ldir  = "info/apollo/react-common";
    inherit packument fetchInfo;
  } // latest';

}
