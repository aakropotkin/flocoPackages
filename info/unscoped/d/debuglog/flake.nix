{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/debuglog?_rev=40-1e0a2b55e1c345fa7d41d3a66012cc94";
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
    ident = "debuglog";
    ldir  = "info/unscoped/d/debuglog";
    inherit packument fetchInfo;
  } // latest';

}
