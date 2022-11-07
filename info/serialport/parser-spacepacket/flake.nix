{

  inputs.packument.url   = "https://registry.npmjs.org/@serialport/parser-spacepacket?rev=10-a36331f290835ad70ee7a8bf7837d32b";
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
    ident = "@serialport/parser-spacepacket";
    ldir  = "info/serialport/parser-spacepacket";
    inherit packument fetchInfo;
  } // latest';

}
