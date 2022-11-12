{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-preset-es2015?_rev=217-65a89906fee75d60623e6e0750453287";
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
    ident = "babel-preset-es2015";
    ldir  = "info/unscoped/b/babel-preset-es2015";
    inherit packument fetchInfo;
  } // latest';

}
