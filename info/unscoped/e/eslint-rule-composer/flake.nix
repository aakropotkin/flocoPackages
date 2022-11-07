{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-rule-composer?rev=5-b8ecbb67098a78ba13894d42f1ea1685";
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
    ident = "eslint-rule-composer";
    ldir  = "info/unscoped/e/eslint-rule-composer";
    inherit packument fetchInfo;
  } // latest';

}
