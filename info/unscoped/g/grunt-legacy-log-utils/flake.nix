{

  inputs.packument.url   = "https://registry.npmjs.org/grunt-legacy-log-utils";
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
    ident = "grunt-legacy-log-utils";
    ldir  = "info/unscoped/g/grunt-legacy-log-utils";
    inherit packument fetchInfo;
  } // latest';

}
