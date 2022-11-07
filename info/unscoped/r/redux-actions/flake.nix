{

  inputs.packument.url   = "https://registry.npmjs.org/redux-actions?rev=71-511e392e6961340b1dba1a56fe2aff06";
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
    ident = "redux-actions";
    ldir  = "info/unscoped/r/redux-actions";
    inherit packument fetchInfo;
  } // latest';

}
