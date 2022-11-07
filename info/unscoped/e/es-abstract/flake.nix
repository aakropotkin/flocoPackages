{

  inputs.packument.url   = "https://registry.npmjs.org/es-abstract?rev=83-ae76d34c858a58c07bc6e8ec25bf7b5f";
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
    ident = "es-abstract";
    ldir  = "info/unscoped/e/es-abstract";
    inherit packument fetchInfo;
  } // latest';

}
