{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/enhanced-resolve?_rev=190-78e0624d59ccf4e0145c871753b93ab9";
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
    ident = "enhanced-resolve";
    ldir  = "info/unscoped/e/enhanced-resolve";
    inherit packument fetchInfo;
  } // latest';

}
