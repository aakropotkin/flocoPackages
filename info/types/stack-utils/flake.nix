{

  inputs.packument.url   = "https://registry.npmjs.org/@types/stack-utils?rev=434-a8db79c2de980d30abe00131f741c5af";
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
    scope = "@types";
    ident = "@types/stack-utils";
    ldir  = "info/types/stack-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
