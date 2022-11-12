{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/csv-generate?_rev=45-d714ab30b2f269d2ef223f6381e4524d";
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
    ident = "csv-generate";
    ldir  = "info/unscoped/c/csv-generate";
    inherit packument fetchInfo;
  } // latest';

}
