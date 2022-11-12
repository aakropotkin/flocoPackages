{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/log4js?_rev=435-4a31c3576c5244580282219f36fc8133";
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
    ident = "log4js";
    ldir  = "info/unscoped/l/log4js";
    inherit packument fetchInfo;
  } // latest';

}
