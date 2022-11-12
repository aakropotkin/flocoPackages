{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@swc/core-linux-arm64-gnu?_rev=199-612e5d33f9cd9a0f0979254d868d2bd0";
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
    ident = "@swc/core-linux-arm64-gnu";
    ldir  = "info/swc/core-linux-arm64-gnu";
    inherit packument fetchInfo;
  } // latest';

}
