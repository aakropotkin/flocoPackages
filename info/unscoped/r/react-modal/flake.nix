{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-modal?_rev=183-52246ad9ddb09a3877ac127f4d6a9eab";
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
    ident = "react-modal";
    ldir  = "info/unscoped/r/react-modal";
    inherit packument fetchInfo;
  } // latest';

}
