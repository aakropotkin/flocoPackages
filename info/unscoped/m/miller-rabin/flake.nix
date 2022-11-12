{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/miller-rabin?_rev=30-4227ff6336edd29cfdfd8558a7817e49";
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
    ident = "miller-rabin";
    ldir  = "info/unscoped/m/miller-rabin";
    inherit packument fetchInfo;
  } // latest';

}
