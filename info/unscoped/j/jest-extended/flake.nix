{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-extended?_rev=35-9bccb2b3804afb6adf4fde4fad8de59e";
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
    ident = "jest-extended";
    ldir  = "info/unscoped/j/jest-extended";
    inherit packument fetchInfo;
  } // latest';

}
