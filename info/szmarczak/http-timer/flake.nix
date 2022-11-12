{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@szmarczak/http-timer?_rev=20-b3d4a78f1bdeecfc7f8bf594a91cf307";
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
    scope = "@szmarczak";
    ident = "@szmarczak/http-timer";
    ldir  = "info/szmarczak/http-timer";
    inherit packument fetchInfo;
  } // latest';

}
