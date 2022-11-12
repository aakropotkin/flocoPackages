{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-transform-flow-strip-types?_rev=112-74dfe825b62e45df7f804c8002719c55";
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
    ident = "babel-plugin-transform-flow-strip-types";
    ldir  = "info/unscoped/b/babel-plugin-transform-flow-strip-types";
    inherit packument fetchInfo;
  } // latest';

}
