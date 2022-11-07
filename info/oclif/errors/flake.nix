{

  inputs.packument.url   = "https://registry.npmjs.org/@oclif/errors?rev=44-ebb9ff3d9a666fb28bc05a45fc600d36";
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
    ident = "@oclif/errors";
    ldir  = "info/oclif/errors";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
