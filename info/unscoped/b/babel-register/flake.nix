{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-register?_rev=168-4c01d066d6202ab0b85cca5a56d40648";
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
    ident = "babel-register";
    ldir  = "info/unscoped/b/babel-register";
    inherit packument fetchInfo;
  } // latest';

}
