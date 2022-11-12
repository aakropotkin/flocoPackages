{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-util?_rev=384-fb3273e3960e04fe66f50762622b9a90";
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
    ident = "jest-util";
    ldir  = "info/unscoped/j/jest-util";
    inherit packument fetchInfo;
  } // latest';

}
