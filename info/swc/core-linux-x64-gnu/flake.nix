{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@swc%2fcore-linux-x64-gnu?_rev=199-4d851fb0175de5b4b76787a6f6a5795a";
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
    ident = "@swc/core-linux-x64-gnu";
    ldir  = "info/swc/core-linux-x64-gnu";
    inherit packument fetchInfo;
  } // latest';

}
