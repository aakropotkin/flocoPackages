{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bluebird?_rev=1130-abfb2550f32460c1c69aa4a2ececf966";
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
    ident = "bluebird";
    ldir  = "info/unscoped/b/bluebird";
    inherit packument fetchInfo;
  } // latest';

}
