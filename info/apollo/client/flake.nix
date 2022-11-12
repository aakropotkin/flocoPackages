{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@apollo/client?_rev=427-5e02cdc0bf19428123aa39d7a32c7c89";
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
    ident = "@apollo/client";
    ldir  = "info/apollo/client";
    inherit packument fetchInfo;
  } // latest';

}
