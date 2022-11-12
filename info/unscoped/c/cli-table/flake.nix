{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cli-table?_rev=130-6e6dcc1f8eb66dc1cd8bb19a632f6fd3";
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
    ident = "cli-table";
    ldir  = "info/unscoped/c/cli-table";
    inherit packument fetchInfo;
  } // latest';

}
