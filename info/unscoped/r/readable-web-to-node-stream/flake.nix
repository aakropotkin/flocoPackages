{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/readable-web-to-node-stream?_rev=15-d9254d3d0ee835e054fc8d28db82dd64";
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
    ident = "readable-web-to-node-stream";
    ldir  = "info/unscoped/r/readable-web-to-node-stream";
    inherit packument fetchInfo;
  } // latest';

}
