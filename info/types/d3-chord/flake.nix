{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-chord?_rev=571-f4edeb81cd2869ac14bbb37ee97cf30c";
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
    ident = "@types/d3-chord";
    ldir  = "info/types/d3-chord";
    inherit packument fetchInfo;
  } // latest';

}
