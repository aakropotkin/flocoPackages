{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/browserify-sign?_rev=62-7afb88258a93a43f96d4e7b1029a3051";
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
    ident = "browserify-sign";
    ldir  = "info/unscoped/b/browserify-sign";
    inherit packument fetchInfo;
  } // latest';

}
