{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@graphql-tools%2fmerge?_rev=966-5be61a46aa7ef323d4b4d53208570d9e";
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
    ident = "@graphql-tools/merge";
    ldir  = "info/graphql-tools/merge";
    inherit packument fetchInfo;
  } // latest';

}
