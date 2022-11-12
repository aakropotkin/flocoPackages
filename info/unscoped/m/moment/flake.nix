{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/moment?_rev=1315-f0e364b7a225ed2e24f57c579e001ffe";
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
    ident = "moment";
    ldir  = "info/unscoped/m/moment";
    inherit packument fetchInfo;
  } // latest';

}
