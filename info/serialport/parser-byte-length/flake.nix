{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport%2fparser-byte-length?_rev=21-c3f2204d466213ffc8b33f85c0005c67";
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
    ident = "@serialport/parser-byte-length";
    ldir  = "info/serialport/parser-byte-length";
    inherit packument fetchInfo;
  } // latest';

}
