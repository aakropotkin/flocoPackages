{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/npm-package-arg?_rev=97-50f0ca982da687042b2bff158e39705e";
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
    ident = "npm-package-arg";
    ldir  = "info/unscoped/n/npm-package-arg";
    inherit packument fetchInfo;
  } // latest';

}
