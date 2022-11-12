{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-devtools-extension?_rev=40-473b6349687cc582214ba53a7a20aeff";
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
    ident = "redux-devtools-extension";
    ldir  = "info/unscoped/r/redux-devtools-extension";
    inherit packument fetchInfo;
  } // latest';

}
