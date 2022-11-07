{

  inputs.packument.url   = "https://registry.npmjs.org/sade?rev=28-5e46ba8513e646ebe5bddd2c2eba90ae";
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
    ident = "sade";
    ldir  = "info/unscoped/s/sade";
    inherit packument fetchInfo;
  } // latest';

}
