{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cache-base?_rev=40-de4c84e8120a7676dad20a8f795dd175";
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
    ident = "cache-base";
    ldir  = "info/unscoped/c/cache-base";
    inherit packument fetchInfo;
  } // latest';

}
