{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jwks-rsa?_rev=102-43c043518ed7a8e3d3b913468e5df719";
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
    ident = "jwks-rsa";
    ldir  = "info/unscoped/j/jwks-rsa";
    inherit packument fetchInfo;
  } // latest';

}
