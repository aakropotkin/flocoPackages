{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@formatjs%2ficu-messageformat-parser?_rev=41-acd55b1210be73a753c0e0bb4deef4f5";
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
    scope = "@formatjs";
    ident = "@formatjs/icu-messageformat-parser";
    ldir  = "info/formatjs/icu-messageformat-parser";
    inherit packument fetchInfo;
  } // latest';

}
