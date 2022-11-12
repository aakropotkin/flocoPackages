{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ethjs-unit?_rev=10-c5c8360b47e287051491764eb6f5e6ac";
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
    ident = "ethjs-unit";
    ldir  = "info/unscoped/e/ethjs-unit";
    inherit packument fetchInfo;
  } // latest';

}
