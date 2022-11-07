{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-es2015-arrow-functions?rev=76-734fa5abb68cb2daf881916e2f4c3086";
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
    ident = "babel-plugin-transform-es2015-arrow-functions";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-arrow-functions";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
