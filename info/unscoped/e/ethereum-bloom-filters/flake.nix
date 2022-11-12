{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ethereum-bloom-filters?_rev=11-aaaaa32b2797c1b8cb42c97bd8353705";
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
    ident = "ethereum-bloom-filters";
    ldir  = "info/unscoped/e/ethereum-bloom-filters";
    inherit packument fetchInfo;
  } // latest';

}
