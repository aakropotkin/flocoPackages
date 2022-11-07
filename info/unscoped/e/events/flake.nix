{

  inputs.packument.url   = "https://registry.npmjs.org/events?rev=109-e311ed9b9d880b6084d0ed1a0d99c699";
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
    ident = "events";
    ldir  = "info/unscoped/e/events";
    inherit packument fetchInfo;
  } // latest';

}
