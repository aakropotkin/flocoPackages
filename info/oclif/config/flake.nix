{

  inputs.packument.url   = "https://registry.npmjs.org/@oclif/config?rev=139-f20ff58994f6c7f580ffd0344b6a698d";
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
    ident = "@oclif/config";
    ldir  = "info/oclif/config";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
