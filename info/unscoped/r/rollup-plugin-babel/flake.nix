{

  inputs.packument.url   = "https://registry.npmjs.org/rollup-plugin-babel?rev=126-c77ee1f412e81feb460575c74c548193";
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
    ident = "rollup-plugin-babel";
    ldir  = "info/unscoped/r/rollup-plugin-babel";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
