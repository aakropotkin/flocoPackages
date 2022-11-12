{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@emotion/react?_rev=33-6864455ea63398924a346a6199b04d47";
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
    scope = "@emotion";
    ident = "@emotion/react";
    ldir  = "info/emotion/react";
    inherit packument fetchInfo;
  } // latest';

}
