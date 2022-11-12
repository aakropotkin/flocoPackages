{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@swc%2fcore-linux-arm-gnueabihf?_rev=199-84c42ab638b03977cca684c07e12410b";
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
    ident = "@swc/core-linux-arm-gnueabihf";
    ldir  = "info/swc/core-linux-arm-gnueabihf";
    inherit packument fetchInfo;
  } // latest';

}
