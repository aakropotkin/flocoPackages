{

  inputs.packument.url   = "https://registry.npmjs.org/jest-worker?rev=172-3d301b920eaa55679490ca5c3d8f69d6";
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
    ident = "jest-worker";
    ldir  = "info/unscoped/j/jest-worker";
    inherit packument fetchInfo;
  } // latest';

}
