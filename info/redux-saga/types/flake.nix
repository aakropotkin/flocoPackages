{

  inputs.packument.url   = "https://registry.npmjs.org/@redux-saga/types?rev=11-a16602546a5d0fccabd456a75a9d81d4";
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
    ident = "@redux-saga/types";
    ldir  = "info/redux-saga/types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
