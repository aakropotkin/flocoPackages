{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/replace-homedir?_rev=9-d78dddf16234c03473d5f39ada66d5d8";
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
    ident = "replace-homedir";
    ldir  = "info/unscoped/r/replace-homedir";
    inherit packument fetchInfo;
  } // latest';

}
