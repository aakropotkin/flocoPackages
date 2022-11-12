{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@fortawesome/fontawesome-common-types?_rev=87-ea58b02d38b41661266d4611e81afe19";
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
    scope = "@fortawesome";
    ident = "@fortawesome/fontawesome-common-types";
    ldir  = "info/fortawesome/fontawesome-common-types";
    inherit packument fetchInfo;
  } // latest';

}
