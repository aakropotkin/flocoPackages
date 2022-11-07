{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-visitor-keys?rev=27-a3060dff030f009eb074fee3a98c9dd0";
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
    ident = "eslint-visitor-keys";
    ldir  = "info/unscoped/e/eslint-visitor-keys";
    inherit packument fetchInfo;
  } // latest';

}
