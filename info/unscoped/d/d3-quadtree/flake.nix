{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-quadtree?_rev=32-e36c0083486c35fe8a2bfab0fc7a15da";
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
    ident = "d3-quadtree";
    ldir  = "info/unscoped/d/d3-quadtree";
    inherit packument fetchInfo;
  } // latest';

}
