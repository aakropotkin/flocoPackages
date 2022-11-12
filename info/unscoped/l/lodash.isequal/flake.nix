{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.isequal?_rev=55-13b330dc95a68bcdb942a2030751c3f5";
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
    ident = "lodash.isequal";
    ldir  = "info/unscoped/l/lodash.isequal";
    inherit packument fetchInfo;
  } // latest';

}
