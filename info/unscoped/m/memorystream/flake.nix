{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/memorystream?_rev=30-7dd02e992a2ccffe39896b97c761efaf";
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
    ident = "memorystream";
    ldir  = "info/unscoped/m/memorystream";
    inherit packument fetchInfo;
  } // latest';

}
