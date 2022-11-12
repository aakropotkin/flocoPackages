{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mime?_rev=269-c3ef5616edfa3d884d8bcd24a1b7ab50";
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
    ident = "mime";
    ldir  = "info/unscoped/m/mime";
    inherit packument fetchInfo;
  } // latest';

}
