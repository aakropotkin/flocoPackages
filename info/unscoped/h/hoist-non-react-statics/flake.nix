{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hoist-non-react-statics?_rev=50-65a5bc4486a01a46bb658e82a31afc0d";
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
