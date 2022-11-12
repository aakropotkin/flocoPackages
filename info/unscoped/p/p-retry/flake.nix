{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/p-retry?_rev=24-60b55eeb7989095d8b41518175278106";
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
    ident = "p-retry";
    ldir  = "info/unscoped/p/p-retry";
    inherit packument fetchInfo;
  } // latest';

}
