{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fhelper-define-polyfill-provider?_rev=24-f58f6d39d0d127d1245cc8ab48de6b34";
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
    ident = "@babel/helper-define-polyfill-provider";
    ldir  = "info/babel/helper-define-polyfill-provider";
    inherit packument fetchInfo;
  } // latest';

}
