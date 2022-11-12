{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/object.defaults?_rev=10-8a1f206e1f6d3f51f1400d2b540719da";
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
    ident = "object.defaults";
    ldir  = "info/unscoped/o/object.defaults";
    inherit packument fetchInfo;
  } // latest';

}
