{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-dynamic-import-node?_rev=31-18f72049e5b9d089afd3e4711aa5d04d";
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
    ident = "babel-plugin-dynamic-import-node";
    ldir  = "info/unscoped/b/babel-plugin-dynamic-import-node";
    inherit packument fetchInfo;
  } // latest';

}
