{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-loader?rev=92-9a2cc7448d7cea9cfc5db714b3295996";
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
    ident = "eslint-loader";
    ldir  = "info/unscoped/e/eslint-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
