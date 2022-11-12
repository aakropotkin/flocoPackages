{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/wcwidth?_rev=10-e54bff83f26ce28e1b41cface5cfeaac";
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
    ident = "wcwidth";
    ldir  = "info/unscoped/w/wcwidth";
    inherit packument fetchInfo;
  } // latest';

}
