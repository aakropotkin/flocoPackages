{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/request-promise?_rev=340-613750da6996d44374e6e6f7adbc3b06";
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
    ident = "request-promise";
    ldir  = "info/unscoped/r/request-promise";
    inherit packument fetchInfo;
  } // latest';

}
