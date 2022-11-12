{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jest%2fexpect-utils?_rev=30-f5f2236156464bd07f1a110ff51455fc";
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
    scope = "@jest";
    ident = "@jest/expect-utils";
    ldir  = "info/jest/expect-utils";
    inherit packument fetchInfo;
  } // latest';

}
