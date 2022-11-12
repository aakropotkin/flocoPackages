{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/eslint-module-utils?_rev=34-47d9ee07d1f552913d05d354493e5f4f";
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
    ident = "eslint-module-utils";
    ldir  = "info/unscoped/e/eslint-module-utils";
    inherit packument fetchInfo;
  } // latest';

}
