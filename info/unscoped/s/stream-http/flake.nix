{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stream-http?_rev=53-571e3fe83bc6690018887ac207c4eeb0";
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
    ident = "stream-http";
    ldir  = "info/unscoped/s/stream-http";
    inherit packument fetchInfo;
  } // latest';

}
