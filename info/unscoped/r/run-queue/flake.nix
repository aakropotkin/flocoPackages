{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/run-queue?_rev=9-a7d87f2bb923ed805f8962fd64bd215b";
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
    ident = "run-queue";
    ldir  = "info/unscoped/r/run-queue";
    inherit packument fetchInfo;
  } // latest';

}
