{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/array-from?_rev=11-356a37e4b1a6e96e53c8f5b41ada73cf";
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
    ident = "array-from";
    ldir  = "info/unscoped/a/array-from";
    inherit packument fetchInfo;
  } // latest';

}
