{

  inputs.packument.url   = "https://registry.npmjs.org/@ember/edition-utils?rev=10-84989c64c8ff0d1ec0396f2833a4d9f0";
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
    scope = "@ember";
    ident = "@ember/edition-utils";
    ldir  = "info/ember/edition-utils";
    inherit packument fetchInfo;
  } // latest';

}
