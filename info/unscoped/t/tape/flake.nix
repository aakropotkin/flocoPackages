{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tape?_rev=415-221bf4581e9e5ee095f3f5addf4af1f6";
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
    ident = "tape";
    ldir  = "info/unscoped/t/tape";
    inherit packument fetchInfo;
  } // latest';

}
