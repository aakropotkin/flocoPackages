{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/undertaker-registry?_rev=17-2c1fb4a18839e23676872c847bd2e26e";
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
    ident = "undertaker-registry";
    ldir  = "info/unscoped/u/undertaker-registry";
    inherit packument fetchInfo;
  } // latest';

}
