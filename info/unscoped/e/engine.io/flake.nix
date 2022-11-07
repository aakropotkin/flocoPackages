{

  inputs.packument.url   = "https://registry.npmjs.org/engine.io?rev=243-3d1fc456c4e2e6050ed4f10d88ef9562";
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
    ident = "engine.io";
    ldir  = "info/unscoped/e/engine.io";
    inherit packument fetchInfo;
  } // latest';

}
