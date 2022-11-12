{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-dynamic-modules-react?_rev=82-162a409abb8e8e141a8523ee9275787d";
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
    ident = "redux-dynamic-modules-react";
    ldir  = "info/unscoped/r/redux-dynamic-modules-react";
    inherit packument fetchInfo;
  } // latest';

}
