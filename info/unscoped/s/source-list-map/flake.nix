{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/source-list-map?_rev=19-6d41f26bc3af030e8f63f1163bbfb7ac";
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
    ident = "source-list-map";
    ldir  = "info/unscoped/s/source-list-map";
    inherit packument fetchInfo;
  } // latest';

}
