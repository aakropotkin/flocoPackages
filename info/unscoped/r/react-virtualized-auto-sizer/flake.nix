{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-virtualized-auto-sizer?_rev=11-1bd214a7f851e1191e41ca31411cc3ab";
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
    ident = "react-virtualized-auto-sizer";
    ldir  = "info/unscoped/r/react-virtualized-auto-sizer";
    inherit packument fetchInfo;
  } // latest';

}
