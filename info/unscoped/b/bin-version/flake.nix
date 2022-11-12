{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bin-version?_rev=17-80dc3b7d5537dfbdeae43c38cb636ed0";
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
    ident = "bin-version";
    ldir  = "info/unscoped/b/bin-version";
    inherit packument fetchInfo;
  } // latest';

}
