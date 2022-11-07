{

  inputs.packument.url   = "https://registry.npmjs.org/@oclif/parser?rev=47-fc2ebb34ddfdc6953c55332923ee5747";
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
    scope = "@oclif";
    ident = "@oclif/parser";
    ldir  = "info/oclif/parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
