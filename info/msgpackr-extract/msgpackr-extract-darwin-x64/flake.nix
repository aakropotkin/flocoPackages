{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@msgpackr-extract/msgpackr-extract-darwin-x64?_rev=4-1413f51e14bba8bea57172cc07a0bc03";
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
    scope = "@msgpackr-extract";
    ident = "@msgpackr-extract/msgpackr-extract-darwin-x64";
    ldir  = "info/msgpackr-extract/msgpackr-extract-darwin-x64";
    inherit packument fetchInfo;
  } // latest';

}
