{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stream-events?_rev=12-6f868d9c3ead69a1db02aa1b70b6dfa9";
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
    ident = "stream-events";
    ldir  = "info/unscoped/s/stream-events";
    inherit packument fetchInfo;
  } // latest';

}
