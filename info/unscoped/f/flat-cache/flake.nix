{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/flat-cache?_rev=36-2d4675dafffcfe9c37028bdac1fb7816";
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
    ident = "flat-cache";
    ldir  = "info/unscoped/f/flat-cache";
    inherit packument fetchInfo;
  } // latest';

}
