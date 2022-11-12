{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/webpack-sources?_rev=62-dbfa254023ab147aafe4c523db769865";
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
    ident = "webpack-sources";
    ldir  = "info/unscoped/w/webpack-sources";
    inherit packument fetchInfo;
  } // latest';

}
