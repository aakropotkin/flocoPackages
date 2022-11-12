{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/utila?_rev=26-8dbc43552a7e4144985b6da5fe920f49";
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
    ident = "utila";
    ldir  = "info/unscoped/u/utila";
    inherit packument fetchInfo;
  } // latest';

}
