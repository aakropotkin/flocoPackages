{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/libnpmdiff?_rev=28-5c2f93e2668a91a8be0c6e0e8f47c3e8";
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
    ident = "libnpmdiff";
    ldir  = "info/unscoped/l/libnpmdiff";
    inherit packument fetchInfo;
  } // latest';

}
