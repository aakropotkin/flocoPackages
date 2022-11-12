{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-messages?_rev=99-16f02d499a6fe33bcdb5da282c445c4c";
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
    ident = "babel-messages";
    ldir  = "info/unscoped/b/babel-messages";
    inherit packument fetchInfo;
  } // latest';

}
