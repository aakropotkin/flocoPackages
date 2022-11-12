{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/grunt-contrib-watch?_rev=320-90e4ef48b51141b9abc521823184010a";
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
    ident = "grunt-contrib-watch";
    ldir  = "info/unscoped/g/grunt-contrib-watch";
    inherit packument fetchInfo;
  } // latest';

}
