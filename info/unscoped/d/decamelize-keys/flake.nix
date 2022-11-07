{

  inputs.packument.url   = "https://registry.npmjs.org/decamelize-keys?rev=10-d2b7337a38f271284db7bce5f23ebdcc";
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
    ident = "decamelize-keys";
    ldir  = "info/unscoped/d/decamelize-keys";
    inherit packument fetchInfo;
  } // latest';

}
