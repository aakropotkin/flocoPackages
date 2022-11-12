{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tslint-react?_rev=35-3f970d6051604f3210182f2251f5e224";
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
    ident = "tslint-react";
    ldir  = "info/unscoped/t/tslint-react";
    inherit packument fetchInfo;
  } // latest';

}
