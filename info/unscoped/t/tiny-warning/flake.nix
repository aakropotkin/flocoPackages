{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tiny-warning?_rev=8-33c307bb4567e9279719c7c177cf9d65";
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
    ident = "tiny-warning";
    ldir  = "info/unscoped/t/tiny-warning";
    inherit packument fetchInfo;
  } // latest';

}
