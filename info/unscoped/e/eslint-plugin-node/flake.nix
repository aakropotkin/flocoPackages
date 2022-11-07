{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-node?rev=82-d8c15ddf56dcab4bb25cbf9f60dbe61f";
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
    ident = "eslint-plugin-node";
    ldir  = "info/unscoped/e/eslint-plugin-node";
    inherit packument fetchInfo;
  } // latest';

}
