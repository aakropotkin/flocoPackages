{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/http-proxy-middleware?_rev=189-c0e850219330c7ee1d3c8177008758fa";
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
    ident = "http-proxy-middleware";
    ldir  = "info/unscoped/h/http-proxy-middleware";
    inherit packument fetchInfo;
  } // latest';

}
