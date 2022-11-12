{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport/stream?_rev=27-90e740f0bd778f314ecd063c6225d2d0";
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
    scope = "@serialport";
    ident = "@serialport/stream";
    ldir  = "info/serialport/stream";
    inherit packument fetchInfo;
  } // latest';

}
