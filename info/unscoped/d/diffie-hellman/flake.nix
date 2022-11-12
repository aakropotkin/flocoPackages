{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/diffie-hellman?_rev=51-4956fb877599c79c774b17fdb29491ce";
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
    ident = "diffie-hellman";
    ldir  = "info/unscoped/d/diffie-hellman";
    inherit packument fetchInfo;
  } // latest';

}
