{

  inputs.packument.url   = "https://registry.npmjs.org/@oclif/screen?rev=26-4430da39112353994d1ebc28c7d2dbb2";
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
    ident = "@oclif/screen";
    ldir  = "info/oclif/screen";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
