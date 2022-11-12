{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nullthrows?_rev=12-b448913b657418211526c17c6a5da5a3";
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
    ident = "nullthrows";
    ldir  = "info/unscoped/n/nullthrows";
    inherit packument fetchInfo;
  } // latest';

}
