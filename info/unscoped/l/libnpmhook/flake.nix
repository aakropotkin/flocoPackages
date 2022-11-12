{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/libnpmhook?_rev=52-ac495c52e83885ab5c1591c3b4f8aba9";
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
    ident = "libnpmhook";
    ldir  = "info/unscoped/l/libnpmhook";
    inherit packument fetchInfo;
  } // latest';

}
