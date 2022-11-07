{

  inputs.packument.url   = "https://registry.npmjs.org/react-router-redux?rev=129-13adf50102b46c01034f708ba51b12e1";
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
    ident = "react-router-redux";
    ldir  = "info/unscoped/r/react-router-redux";
    inherit packument fetchInfo;
  } // latest';

}
