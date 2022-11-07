{

  inputs.packument.url   = "https://registry.npmjs.org/redux-thunk?rev=124-69f9157da786806cccda9ee4b8a59b06";
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
    ident = "redux-thunk";
    ldir  = "info/unscoped/r/redux-thunk";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
