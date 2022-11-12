{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jsonparse?_rev=28-fa14e4ebfe24657378bf4cd541f5a4ce";
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
    ident = "jsonparse";
    ldir  = "info/unscoped/j/jsonparse";
    inherit packument fetchInfo;
  } // latest';

}
