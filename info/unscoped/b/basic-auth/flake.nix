{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/basic-auth?_rev=72-20da757bf56e9b21d9362357332c2915";
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
    ident = "basic-auth";
    ldir  = "info/unscoped/b/basic-auth";
    inherit packument fetchInfo;
  } // latest';

}
