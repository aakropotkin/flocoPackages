{

  inputs.packument.url   = "https://registry.npmjs.org/@serialport/parser-regex";
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
    ident = "@serialport/parser-regex";
    ldir  = "info/serialport/parser-regex";
    inherit packument fetchInfo;
  } // latest';

}
