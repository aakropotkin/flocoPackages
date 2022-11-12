{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-module-transforms?_rev=116-1261eb21f7296acb00b810e0acaa3d15";
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
    scope = "@babel";
    ident = "@babel/helper-module-transforms";
    ldir  = "info/babel/helper-module-transforms";
    inherit packument fetchInfo;
  } // latest';

}
