{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/datafire?_rev=77-6805d746ccd25346c5fd9fc3a94eac2e";
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
    ident = "datafire";
    ldir  = "info/unscoped/d/datafire";
    inherit packument fetchInfo;
  } // latest';

}
