{

  inputs.packument.url   = "https://registry.npmjs.org/@redux-saga/core?rev=16-a899d0a41badca119b3eed4914a9e35e";
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
    scope = "@redux-saga";
    ident = "@redux-saga/core";
    ldir  = "info/redux-saga/core";
    inherit packument fetchInfo;
  } // latest';

}
