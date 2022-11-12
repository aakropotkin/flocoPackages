{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/core-util-is?_rev=15-f43db8b21eed7517e44fd4383abc1bf1";
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
    ident = "core-util-is";
    ldir  = "info/unscoped/c/core-util-is";
    inherit packument fetchInfo;
  } // latest';

}
