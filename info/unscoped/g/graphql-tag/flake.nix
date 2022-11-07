{

  inputs.packument.url   = "https://registry.npmjs.org/graphql-tag?rev=92-48ec561b0723c86101586ae685419135";
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
    ident = "graphql-tag";
    ldir  = "info/unscoped/g/graphql-tag";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
