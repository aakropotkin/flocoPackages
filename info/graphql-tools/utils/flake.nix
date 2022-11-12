{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@graphql-tools/utils?_rev=992-2db65ce901af4c1b5dd5076df3a0649d";
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
    scope = "@graphql-tools";
    ident = "@graphql-tools/utils";
    ldir  = "info/graphql-tools/utils";
    inherit packument fetchInfo;
  } // latest';

}
