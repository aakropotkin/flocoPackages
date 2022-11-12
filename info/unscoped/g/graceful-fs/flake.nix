{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/graceful-fs?_rev=221-c00577269c15de2147d285f018cc9679";
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
    ident = "graceful-fs";
    ldir  = "info/unscoped/g/graceful-fs";
    inherit packument fetchInfo;
  } // latest';

}
