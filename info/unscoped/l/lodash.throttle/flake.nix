{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.throttle?_rev=57-3ac6c9a6bef8f8b799b33477142f4aa7";
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
    ident = "lodash.throttle";
    ldir  = "info/unscoped/l/lodash.throttle";
    inherit packument fetchInfo;
  } // latest';

}
