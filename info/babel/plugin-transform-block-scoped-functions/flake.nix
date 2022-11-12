{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-block-scoped-functions?_rev=78-10b516e497eaf877ad52fb4866090aaa";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-block-scoped-functions";
    ldir  = "info/babel/plugin-transform-block-scoped-functions";
    inherit packument fetchInfo;
  } // latest';

}
