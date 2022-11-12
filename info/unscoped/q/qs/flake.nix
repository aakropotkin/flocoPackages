{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/qs?_rev=403-64bdf8ada0c57cdb1dfaf22c6be6e723";
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
    ident = "qs";
    ldir  = "info/unscoped/q/qs";
    inherit packument fetchInfo;
  } // latest';

}
