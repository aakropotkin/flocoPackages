{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@swc/core-darwin-arm64?_rev=199-f94f21b43d0a532a7fd274365dff3990";
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
    scope = "@swc";
    ident = "@swc/core-darwin-arm64";
    ldir  = "info/swc/core-darwin-arm64";
    inherit packument fetchInfo;
  } // latest';

}
