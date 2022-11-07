{

  inputs.packument.url   = "https://registry.npmjs.org/es-aggregate-error?rev=13-c67c15147ede3c957a8ef4b2b9957ca4";
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
    ident = "es-aggregate-error";
    ldir  = "info/unscoped/e/es-aggregate-error";
    inherit packument fetchInfo;
  } // latest';

}
