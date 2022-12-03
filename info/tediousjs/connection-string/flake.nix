{

  inputs.packument.url   = "https://registry.npmjs.org/@tediousjs/connection-string";
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
    scope = "@tediousjs";
    ident = "@tediousjs/connection-string";
    ldir  = "info/tediousjs/connection-string";
    inherit packument fetchInfo;
  } // latest';

}
