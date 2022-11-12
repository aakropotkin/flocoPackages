{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@fortawesome/fontawesome-svg-core?_rev=80-a6df216020a27a1b5a20e319ad7d5b88";
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
    ident = "@fortawesome/fontawesome-svg-core";
    ldir  = "info/fortawesome/fontawesome-svg-core";
    inherit packument fetchInfo;
  } // latest';

}
