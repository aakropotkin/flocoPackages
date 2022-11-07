{

  inputs.packument.url   = "https://registry.npmjs.org/@serialport/parser-slip-encoder?rev=22-4fdb2bfc0cf5d55ed8465262a967052b";
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
    ident = "@serialport/parser-slip-encoder";
    ldir  = "info/serialport/parser-slip-encoder";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
