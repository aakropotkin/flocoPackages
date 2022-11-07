{

  inputs.packument.url   = "https://registry.npmjs.org/@oclif/help?rev=4-8656ceb641b30b3ecc9c7f5061cba04e";
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
    ident = "@oclif/help";
    ldir  = "info/oclif/help";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
