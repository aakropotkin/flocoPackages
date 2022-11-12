{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/preset-typescript?_rev=91-ddb5f2b7ac8cc6d7f67c63aaa7f9dc90";
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
    ident = "@babel/preset-typescript";
    ldir  = "info/babel/preset-typescript";
    inherit packument fetchInfo;
  } // latest';

}
