{

  inputs.packument.url   = "https://registry.npmjs.org/react-virtualized-auto-sizer";
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
