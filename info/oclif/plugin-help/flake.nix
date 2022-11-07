{

  inputs.packument.url   = "https://registry.npmjs.org/@oclif/plugin-help?rev=118-d4b65afd627791386b043ffaac16727f";
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
    ident = "@oclif/plugin-help";
    ldir  = "info/oclif/plugin-help";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
