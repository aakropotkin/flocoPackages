{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/secure-keys?_rev=4-7884e2e337d8dd4e8273647ff999084a";
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
    ident = "secure-keys";
    ldir  = "info/unscoped/s/secure-keys";
    inherit packument fetchInfo;
  } // latest';

}
