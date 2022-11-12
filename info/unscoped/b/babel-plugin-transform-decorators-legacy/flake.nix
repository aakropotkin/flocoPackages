{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-transform-decorators-legacy?_rev=46-24d930bbbaa943e150c2f4c9a23c3503";
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
    ident = "babel-plugin-transform-decorators-legacy";
    ldir  = "info/unscoped/b/babel-plugin-transform-decorators-legacy";
    inherit packument fetchInfo;
  } // latest';

}
