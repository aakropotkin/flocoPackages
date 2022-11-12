{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/secure-json-parse?_rev=10-62c378e2272513ace071076ddcaf57ea";
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
    ident = "secure-json-parse";
    ldir  = "info/unscoped/s/secure-json-parse";
    inherit packument fetchInfo;
  } // latest';

}
