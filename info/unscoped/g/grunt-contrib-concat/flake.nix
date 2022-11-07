{

  inputs.packument.url   = "https://registry.npmjs.org/grunt-contrib-concat?rev=203-ead6fb19d54f0cabe93cff4299af68f6";
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
    ident = "grunt-contrib-concat";
    ldir  = "info/unscoped/g/grunt-contrib-concat";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
