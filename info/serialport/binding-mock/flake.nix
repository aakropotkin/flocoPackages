{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport%2fbinding-mock?_rev=24-bc5492e715466177b3bce090bde360f5";
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
    ident = "@serialport/binding-mock";
    ldir  = "info/serialport/binding-mock";
    inherit packument fetchInfo;
  } // latest';

}
