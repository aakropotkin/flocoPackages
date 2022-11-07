{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-selector-parser?rev=64-145829a6aade235a710601868d378881";
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
    ident = "postcss-selector-parser";
    ldir  = "info/unscoped/p/postcss-selector-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
