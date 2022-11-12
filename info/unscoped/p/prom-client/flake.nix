{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/prom-client?_rev=91-a0f557b05914eb6edc3493f741552d47";
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
    ident = "prom-client";
    ldir  = "info/unscoped/p/prom-client";
    inherit packument fetchInfo;
  } // latest';

}
