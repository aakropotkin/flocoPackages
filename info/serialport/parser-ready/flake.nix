{

  inputs.packument.url   = "https://registry.npmjs.org/@serialport/parser-ready?rev=21-28a641c8daf418f1b602dc656788fbf3";
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
    ident = "@serialport/parser-ready";
    ldir  = "info/serialport/parser-ready";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
