{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport%2fparser-packet-length?_rev=8-fa5b2a06c6245c402d42096ca3d3bc04";
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
    ident = "@serialport/parser-packet-length";
    ldir  = "info/serialport/parser-packet-length";
    inherit packument fetchInfo;
  } // latest';

}
