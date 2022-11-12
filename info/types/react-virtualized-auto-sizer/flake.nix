{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/react-virtualized-auto-sizer?_rev=257-6709d01e97b658a339fc348a28efb6d9";
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
    ident = "@types/react-virtualized-auto-sizer";
    ldir  = "info/types/react-virtualized-auto-sizer";
    inherit packument fetchInfo;
  } // latest';

}
