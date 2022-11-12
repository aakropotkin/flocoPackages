{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@swc%2fcore-linux-arm64-musl?_rev=182-f5bb6bfbd407e6bd3f7cfafac378f1d8";
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
    ident = "@swc/core-linux-arm64-musl";
    ldir  = "info/swc/core-linux-arm64-musl";
    inherit packument fetchInfo;
  } // latest';

}
