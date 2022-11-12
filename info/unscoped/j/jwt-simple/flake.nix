{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jwt-simple?_rev=133-6f41fde01d08b29face837cd282994a8";
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
    ident = "jwt-simple";
    ldir  = "info/unscoped/j/jwt-simple";
    inherit packument fetchInfo;
  } // latest';

}
