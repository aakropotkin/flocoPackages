{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/xhr-request-promise?_rev=6-0224b43fc3f4b314c201ecebd14a0fc2";
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
    ident = "xhr-request-promise";
    ldir  = "info/unscoped/x/xhr-request-promise";
    inherit packument fetchInfo;
  } // latest';

}
