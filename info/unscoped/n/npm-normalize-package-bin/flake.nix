{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/npm-normalize-package-bin?_rev=22-3f46c82d2527feee402d8f8ca2aabd14";
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
    ident = "npm-normalize-package-bin";
    ldir  = "info/unscoped/n/npm-normalize-package-bin";
    inherit packument fetchInfo;
  } // latest';

}
