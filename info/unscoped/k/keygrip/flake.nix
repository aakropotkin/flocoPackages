{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/keygrip?_rev=71-cc3f96c6261f98c6157264b9b756cefa";
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
    ident = "keygrip";
    ldir  = "info/unscoped/k/keygrip";
    inherit packument fetchInfo;
  } // latest';

}
