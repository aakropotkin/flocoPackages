{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-error-boundary?_rev=36-97f2645a2117d934155a8061eacf9a8e";
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
    ident = "react-error-boundary";
    ldir  = "info/unscoped/r/react-error-boundary";
    inherit packument fetchInfo;
  } // latest';

}
