{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport%2fparser-inter-byte-timeout?_rev=17-e7ff8ae9c3858eaecd1ffd940a2962f4";
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
    ident = "@serialport/parser-inter-byte-timeout";
    ldir  = "info/serialport/parser-inter-byte-timeout";
    inherit packument fetchInfo;
  } // latest';

}
