{

  inputs.packument.url   = "https://registry.npmjs.org/hoist-non-react-statics";
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
    ident = "hoist-non-react-statics";
    ldir  = "info/unscoped/h/hoist-non-react-statics";
    inherit packument fetchInfo;
  } // latest';

}
