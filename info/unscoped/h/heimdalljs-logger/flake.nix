{

  inputs.packument.url   = "https://registry.npmjs.org/heimdalljs-logger?rev=18-b026671eaee2f4fd2f7ca9d2c22459bb";
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
    ident = "heimdalljs-logger";
    ldir  = "info/unscoped/h/heimdalljs-logger";
    inherit packument fetchInfo;
  } // latest';

}
