{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-syntax-decorators?_rev=67-01f72c3a0ca0d0d1fb533123928ecf9c";
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
    ident = "babel-plugin-syntax-decorators";
    ldir  = "info/unscoped/b/babel-plugin-syntax-decorators";
    inherit packument fetchInfo;
  } // latest';

}
