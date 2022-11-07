{

  inputs.packument.url   = "https://registry.npmjs.org/serialport?rev=420-fa4cd060f653b6be09f0957af49f29b4";
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
    scope = null;
    ident = "serialport";
    ldir  = "info/unscoped/s/serialport";
    inherit packument fetchInfo;
  } // latest';

}
