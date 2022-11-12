{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/async-mqtt?_rev=19-78181f120da529b5440c9209849b2c7d";
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
    ident = "async-mqtt";
    ldir  = "info/unscoped/a/async-mqtt";
    inherit packument fetchInfo;
  } // latest';

}
