{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@bcoe/v8-coverage?_rev=5-4b3dd94d17f89f97a6600e39ddfa62c7";
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
    scope = "@bcoe";
    ident = "@bcoe/v8-coverage";
    ldir  = "info/bcoe/v8-coverage";
    inherit packument fetchInfo;
  } // latest';

}
