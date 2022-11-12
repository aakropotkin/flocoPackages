{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@apollo/react-hoc?_rev=39-920c6cf5805eaa9a335be7828f6a4d42";
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
    ident = "@apollo/react-hoc";
    ldir  = "info/apollo/react-hoc";
    inherit packument fetchInfo;
  } // latest';

}
