{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-libs-browser?_rev=52-c67de4bbf46b8211e124244a4204f3d9";
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
    ident = "node-libs-browser";
    ldir  = "info/unscoped/n/node-libs-browser";
    inherit packument fetchInfo;
  } // latest';

}
