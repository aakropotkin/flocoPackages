{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/traverse?_rev=147-9c7683ed7ef3eab2115fbcb9704738ec";
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
    ident = "@babel/traverse";
    ldir  = "info/babel/traverse";
    inherit packument fetchInfo;
  } // latest';

}
