{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/d3-drag?_rev=589-21607ef98d574a876fbffaaa07036af3";
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
    ident = "@types/d3-drag";
    ldir  = "info/types/d3-drag";
    inherit packument fetchInfo;
  } // latest';

}
