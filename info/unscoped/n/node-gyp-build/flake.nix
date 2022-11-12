{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-gyp-build?_rev=35-f3d34d9273c6c421475c0f7d800f7b68";
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
    ident = "node-gyp-build";
    ldir  = "info/unscoped/n/node-gyp-build";
    inherit packument fetchInfo;
  } // latest';

}
