{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-n?rev=14-b76d943c3b2ddc8140252a3e11eef454";
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
    ident = "eslint-plugin-n";
    ldir  = "info/unscoped/e/eslint-plugin-n";
    inherit packument fetchInfo;
  } // latest';

}
