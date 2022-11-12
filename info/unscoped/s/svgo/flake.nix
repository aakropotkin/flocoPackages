{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/svgo?_rev=235-5c1e5cdc27a10613e9e04de0b9b1035c";
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
    ident = "svgo";
    ldir  = "info/unscoped/s/svgo";
    inherit packument fetchInfo;
  } // latest';

}
