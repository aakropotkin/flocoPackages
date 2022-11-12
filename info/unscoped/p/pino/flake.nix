{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pino?_rev=361-192718fdb769fba48e911d74f1827633";
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
    ident = "pino";
    ldir  = "info/unscoped/p/pino";
    inherit packument fetchInfo;
  } // latest';

}
