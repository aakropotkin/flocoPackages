{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-prettier?rev=46-7679abcba3672e04320add0ae2ee86b3";
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
    ident = "eslint-plugin-prettier";
    ldir  = "info/unscoped/e/eslint-plugin-prettier";
    inherit packument fetchInfo;
  } // latest';

}
