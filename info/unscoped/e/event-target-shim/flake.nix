{

  inputs.packument.url   = "https://registry.npmjs.org/event-target-shim?rev=36-51eaf576021592ff33984ee7d7f2c4d7";
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
    ident = "event-target-shim";
    ldir  = "info/unscoped/e/event-target-shim";
    inherit packument fetchInfo;
  } // latest';

}
