{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-modules-commonjs?rev=102-9c6b2b9e814ab22e9c8ecb53c269e9a3";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-modules-commonjs";
    ldir  = "info/babel/plugin-transform-modules-commonjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
