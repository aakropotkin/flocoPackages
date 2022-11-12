{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/npm-registry-fetch?_rev=96-7aa6c591a0ed28f489672b09c1645faf";
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
    ident = "npm-registry-fetch";
    ldir  = "info/unscoped/n/npm-registry-fetch";
    inherit packument fetchInfo;
  } // latest';

}
