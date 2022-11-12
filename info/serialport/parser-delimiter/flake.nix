{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport%2fparser-delimiter?_rev=21-94660c59781e02241ee125db54720d7f";
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
    ident = "@serialport/parser-delimiter";
    ldir  = "info/serialport/parser-delimiter";
    inherit packument fetchInfo;
  } // latest';

}
