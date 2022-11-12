{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-stream-zip?_rev=62-6345d9ed2e4aa2936c8faf0825639b2d";
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
    ident = "node-stream-zip";
    ldir  = "info/unscoped/n/node-stream-zip";
    inherit packument fetchInfo;
  } // latest';

}
