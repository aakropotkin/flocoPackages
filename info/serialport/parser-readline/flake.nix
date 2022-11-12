{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport%2fparser-readline?_rev=21-64bf6ab841b785ce529c572cef2d3ff2";
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
    ident = "@serialport/parser-readline";
    ldir  = "info/serialport/parser-readline";
    inherit packument fetchInfo;
  } // latest';

}
