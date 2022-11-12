{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/eslint-plugin-react?_rev=320-32219315db132e8f836fe9f84ea0c25c";
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
