{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/broccoli-debug?_rev=15-b945c08dc7f5c1ea070dd076f4b5cc74";
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
    ident = "broccoli-debug";
    ldir  = "info/unscoped/b/broccoli-debug";
    inherit packument fetchInfo;
  } // latest';

}
