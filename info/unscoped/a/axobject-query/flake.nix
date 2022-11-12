{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/axobject-query?_rev=16-4eeed6b7226554c373e2e6f62b325aae";
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
    ident = "axobject-query";
    ldir  = "info/unscoped/a/axobject-query";
    inherit packument fetchInfo;
  } // latest';

}
