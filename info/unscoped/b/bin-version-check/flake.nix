{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bin-version-check?_rev=15-4333ae4dd005ae7dc5bdd0d041bdb5f0";
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
    ident = "bin-version-check";
    ldir  = "info/unscoped/b/bin-version-check";
    inherit packument fetchInfo;
  } // latest';

}
