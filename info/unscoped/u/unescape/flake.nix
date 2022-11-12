{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/unescape?_rev=11-5b51f6b71f3401200e6b25a797f79fda";
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
    ident = "unescape";
    ldir  = "info/unscoped/u/unescape";
    inherit packument fetchInfo;
  } // latest';

}
