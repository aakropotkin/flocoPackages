{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/semver-truncate?_rev=11-21be03cd664c7893b30b0efa4cfb3e98";
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
    ident = "semver-truncate";
    ldir  = "info/unscoped/s/semver-truncate";
    inherit packument fetchInfo;
  } // latest';

}
