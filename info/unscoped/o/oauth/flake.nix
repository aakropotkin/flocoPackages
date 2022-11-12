{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/oauth?_rev=149-6cfbeb9ad64341395a622d67966f5d6c";
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
    ident = "oauth";
    ldir  = "info/unscoped/o/oauth";
    inherit packument fetchInfo;
  } // latest';

}
