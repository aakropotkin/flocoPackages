{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cli-table3?_rev=9-c25c3e4e224624ba7072a7c3f81116fb";
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
    ident = "cli-table3";
    ldir  = "info/unscoped/c/cli-table3";
    inherit packument fetchInfo;
  } // latest';

}
