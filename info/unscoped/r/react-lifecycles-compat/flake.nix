{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-lifecycles-compat?_rev=34-5c51336806461389a4ff7997455b84f7";
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
    ident = "react-lifecycles-compat";
    ldir  = "info/unscoped/r/react-lifecycles-compat";
    inherit packument fetchInfo;
  } // latest';

}
