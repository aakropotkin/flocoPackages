{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/workbox-webpack-plugin?_rev=114-0f7705a42e100062b806077e6bf00882";
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
    ident = "workbox-webpack-plugin";
    ldir  = "info/unscoped/w/workbox-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
