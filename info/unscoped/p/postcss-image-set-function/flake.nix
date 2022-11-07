{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-image-set-function?rev=13-8ae9283af8cc9d6f2fec1585001807e8";
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
    ident = "postcss-image-set-function";
    ldir  = "info/unscoped/p/postcss-image-set-function";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
