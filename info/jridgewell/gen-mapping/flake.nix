{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jridgewell/gen-mapping?_rev=5-d79dbace82f1621d0ee0900345b79542";
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
    scope = "@jridgewell";
    ident = "@jridgewell/gen-mapping";
    ldir  = "info/jridgewell/gen-mapping";
    inherit packument fetchInfo;
  } // latest';

}
