{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-get-type?_rev=110-29792f3fb33280d90b0abee1938ca809";
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
    ident = "jest-get-type";
    ldir  = "info/unscoped/j/jest-get-type";
    inherit packument fetchInfo;
  } // latest';

}
