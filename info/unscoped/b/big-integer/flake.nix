{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/big-integer?_rev=162-c26cb65da64a02ec3c1296233a5f5a23";
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
    ident = "big-integer";
    ldir  = "info/unscoped/b/big-integer";
    inherit packument fetchInfo;
  } // latest';

}
