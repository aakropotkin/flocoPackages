{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/opener?_rev=66-3c9320c594da32fa0fc87e23d017af9a";
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
    ident = "opener";
    ldir  = "info/unscoped/o/opener";
    inherit packument fetchInfo;
  } // latest';

}
