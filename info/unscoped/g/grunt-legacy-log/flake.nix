{

  inputs.packument.url   = "https://registry.npmjs.org/grunt-legacy-log?rev=18-0ce3325ea5713d354482fde86826a047";
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
    ident = "grunt-legacy-log";
    ldir  = "info/unscoped/g/grunt-legacy-log";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
