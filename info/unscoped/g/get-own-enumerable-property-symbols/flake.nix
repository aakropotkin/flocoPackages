{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/get-own-enumerable-property-symbols?_rev=10-e2e4409e655d08dda2e66f9092444eac";
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
    ident = "get-own-enumerable-property-symbols";
    ldir  = "info/unscoped/g/get-own-enumerable-property-symbols";
    inherit packument fetchInfo;
  } // latest';

}
