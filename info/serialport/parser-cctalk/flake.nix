{

  inputs.packument.url   = "https://registry.npmjs.org/@serialport/parser-cctalk?rev=21-f873b3777b6a96b571bb8641d3337dd4";
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
    ident = "@serialport/parser-cctalk";
    ldir  = "info/serialport/parser-cctalk";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
