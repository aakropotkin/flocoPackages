{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-polyfill-corejs3?rev=32-4db8ca8c424468f29f80aec86efdd1bc";
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
    ident = "babel-plugin-polyfill-corejs3";
    ldir  = "info/unscoped/b/babel-plugin-polyfill-corejs3";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
