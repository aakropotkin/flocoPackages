{

  inputs.packument.url   = "https://registry.npmjs.org/rollup-plugin-commonjs?rev=86-d28e269d34eb306788fdb041a7bf92e5";
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
    ident = "rollup-plugin-commonjs";
    ldir  = "info/unscoped/r/rollup-plugin-commonjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
