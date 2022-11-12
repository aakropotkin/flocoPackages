{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/grunt-contrib-uglify?_rev=297-b267dafda707101a9b4d71589d6a16fe";
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
    ident = "grunt-contrib-uglify";
    ldir  = "info/unscoped/g/grunt-contrib-uglify";
    inherit packument fetchInfo;
  } // latest';

}
