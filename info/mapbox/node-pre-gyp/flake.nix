{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@mapbox%2fnode-pre-gyp?_rev=17-6219030b808a4256828edd79e295e02c";
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
    scope = "@mapbox";
    ident = "@mapbox/node-pre-gyp";
    ldir  = "info/mapbox/node-pre-gyp";
    inherit packument fetchInfo;
  } // latest';

}
