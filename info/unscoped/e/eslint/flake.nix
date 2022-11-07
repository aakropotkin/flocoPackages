{

  inputs.packument.url   = "https://registry.npmjs.org/eslint?rev=821-5c25d998192a98c6e9b1c08514bd0f71";
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
    ident = "eslint";
    ldir  = "info/unscoped/e/eslint";
    inherit packument fetchInfo;
  } // latest';

}
