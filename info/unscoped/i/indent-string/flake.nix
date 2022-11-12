{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/indent-string?_rev=30-ae00fb44bf7fc751d7a1fe28c5f11df7";
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
    ident = "indent-string";
    ldir  = "info/unscoped/i/indent-string";
    inherit packument fetchInfo;
  } // latest';

}
