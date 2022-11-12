{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fpg?_rev=1042-b41500acfb316b474ce26498bf47b62e";
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
    ident = "@types/pg";
    ldir  = "info/types/pg";
    inherit packument fetchInfo;
  } // latest';

}
