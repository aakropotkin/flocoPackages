{

  inputs.packument.url   = "https://registry.npmjs.org/should-type-adaptors?rev=6-a7c485b71b30fea423b97ab099902310";
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
    ident = "should-type-adaptors";
    ldir  = "info/unscoped/s/should-type-adaptors";
    inherit packument fetchInfo;
  } // latest';

}
