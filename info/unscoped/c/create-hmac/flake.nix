{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/create-hmac?_rev=30-71f7a41a2e1191d47d5201c0472d69e1";
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
    ident = "create-hmac";
    ldir  = "info/unscoped/c/create-hmac";
    inherit packument fetchInfo;
  } // latest';

}
