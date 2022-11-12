{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@google-cloud/projectify?_rev=28-01741af2858d078867d6d1aaba5138f5";
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
    scope = "@google-cloud";
    ident = "@google-cloud/projectify";
    ldir  = "info/google-cloud/projectify";
    inherit packument fetchInfo;
  } // latest';

}
