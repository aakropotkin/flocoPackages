{

  inputs.packument.url   = "https://registry.npmjs.org/@graphql-typed-document-node/core";
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
    scope = "@graphql-typed-document-node";
    ident = "@graphql-typed-document-node/core";
    ldir  = "info/graphql-typed-document-node/core";
    inherit packument fetchInfo;
  } // latest';

}
