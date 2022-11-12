{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/append-field?_rev=6-0a56339fa8a95fbe0751d684f99d2d24";
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
    ident = "append-field";
    ldir  = "info/unscoped/a/append-field";
    inherit packument fetchInfo;
  } // latest';

}
