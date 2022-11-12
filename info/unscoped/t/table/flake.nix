{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/table?_rev=126-5bbbb2b7d0bfaa41061bf7c1e07a2b7b";
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
    ident = "table";
    ldir  = "info/unscoped/t/table";
    inherit packument fetchInfo;
  } // latest';

}
