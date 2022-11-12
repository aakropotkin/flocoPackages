{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-gyp?_rev=393-cd44e42105dc0adbad1ebf5e203257ad";
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
    ident = "node-gyp";
    ldir  = "info/unscoped/n/node-gyp";
    inherit packument fetchInfo;
  } // latest';

}
