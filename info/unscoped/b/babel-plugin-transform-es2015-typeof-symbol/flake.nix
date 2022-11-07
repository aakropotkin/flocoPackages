{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-es2015-typeof-symbol?rev=82-f1ee52ff112971cf362573d4e5f366fd";
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
    ident = "babel-plugin-transform-es2015-typeof-symbol";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-typeof-symbol";
    inherit packument fetchInfo;
  } // latest';

}
