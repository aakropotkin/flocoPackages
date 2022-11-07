{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-syntax-function-bind?rev=64-be20c1ca5b9a58e8e7fb50e7d10fb523";
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
    ident = "babel-plugin-syntax-function-bind";
    ldir  = "info/unscoped/b/babel-plugin-syntax-function-bind";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
