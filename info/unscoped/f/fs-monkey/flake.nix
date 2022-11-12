{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fs-monkey?_rev=16-9ae11269131a5e564e72b40fa11cd5b2";
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
    ident = "fs-monkey";
    ldir  = "info/unscoped/f/fs-monkey";
    inherit packument fetchInfo;
  } // latest';

}
