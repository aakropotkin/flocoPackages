{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ember-cli-version-checker?_rev=45-ac26eea41f1c495a5d79f56138b584e0";
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
    ident = "ember-cli-version-checker";
    ldir  = "info/unscoped/e/ember-cli-version-checker";
    inherit packument fetchInfo;
  } // latest';

}
