{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-dynamic-modules-core?_rev=82-a1c8f6512e412743a7c4394f7c2fb941";
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
    ident = "redux-dynamic-modules-core";
    ldir  = "info/unscoped/r/redux-dynamic-modules-core";
    inherit packument fetchInfo;
  } // latest';

}
