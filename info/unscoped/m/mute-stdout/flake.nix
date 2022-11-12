{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mute-stdout?_rev=12-a8d690a00ee19d1078f17f81c29ef160";
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
    ident = "mute-stdout";
    ldir  = "info/unscoped/m/mute-stdout";
    inherit packument fetchInfo;
  } // latest';

}
