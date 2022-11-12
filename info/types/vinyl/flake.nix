{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/vinyl?_rev=536-22ada8308f400ef583f3958a5e796f2c";
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
    scope = "@types";
    ident = "@types/vinyl";
    ldir  = "info/types/vinyl";
    inherit packument fetchInfo;
  } // latest';

}
