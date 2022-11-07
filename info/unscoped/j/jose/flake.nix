{

  inputs.packument.url   = "https://registry.npmjs.org/jose?rev=177-86e09072457fd9b39a61d4e490dca33e";
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
    ident = "jose";
    ldir  = "info/unscoped/j/jose";
    inherit packument fetchInfo;
  } // latest';

}
