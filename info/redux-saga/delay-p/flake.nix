{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@redux-saga%2fdelay-p?_rev=14-b56d504f4e548b9eec0b4b9c05f88ef6";
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
    ident = "@redux-saga/delay-p";
    ldir  = "info/redux-saga/delay-p";
    inherit packument fetchInfo;
  } // latest';

}
