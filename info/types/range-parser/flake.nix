{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/range-parser?_rev=530-058485ff98f3270a72b8d3ec02f62eb7";
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
    ident = "@types/range-parser";
    ldir  = "info/types/range-parser";
    inherit packument fetchInfo;
  } // latest';

}
