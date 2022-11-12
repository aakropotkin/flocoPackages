{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-force?_rev=45-8874467a005ac4e7c9ea0f2a4926de15";
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
    ident = "d3-force";
    ldir  = "info/unscoped/d/d3-force";
    inherit packument fetchInfo;
  } // latest';

}
