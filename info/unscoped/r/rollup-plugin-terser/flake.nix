{

  inputs.packument.url   = "https://registry.npmjs.org/rollup-plugin-terser?rev=25-e6cbf0fedec63832038b25738e56242b";
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
    ident = "rollup-plugin-terser";
    ldir  = "info/unscoped/r/rollup-plugin-terser";
    inherit packument fetchInfo;
  } // latest';

}
