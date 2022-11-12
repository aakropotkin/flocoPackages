{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-template?_rev=113-3bf8e6ddb90ec55ec254cbe5eb73b879";
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
    ident = "babel-template";
    ldir  = "info/unscoped/b/babel-template";
    inherit packument fetchInfo;
  } // latest';

}
