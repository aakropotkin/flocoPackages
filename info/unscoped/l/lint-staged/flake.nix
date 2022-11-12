{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lint-staged?_rev=256-5cf2d1580c7c103f1c36f0aaf7fc0fa7";
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
    ident = "lint-staged";
    ldir  = "info/unscoped/l/lint-staged";
    inherit packument fetchInfo;
  } // latest';

}
