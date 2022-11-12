{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-loader?_rev=230-10b7c6387fe338a4eddc922d060b9644";
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
    ident = "babel-loader";
    ldir  = "info/unscoped/b/babel-loader";
    inherit packument fetchInfo;
  } // latest';

}
