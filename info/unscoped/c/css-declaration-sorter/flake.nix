{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/css-declaration-sorter?_rev=45-ba5b33a6763e67f64f7daa594af48f48";
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
    ident = "css-declaration-sorter";
    ldir  = "info/unscoped/c/css-declaration-sorter";
    inherit packument fetchInfo;
  } // latest';

}
