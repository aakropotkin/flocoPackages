{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-react";
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
    ident = "eslint-plugin-react";
    ldir  = "info/unscoped/e/eslint-plugin-react";
    inherit packument fetchInfo;
  } // latest';

}
