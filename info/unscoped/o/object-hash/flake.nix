{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/object-hash?_rev=98-eb7ae99ff82599f8e48800619f96ffc4";
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
    ident = "object-hash";
    ldir  = "info/unscoped/o/object-hash";
    inherit packument fetchInfo;
  } // latest';

}
