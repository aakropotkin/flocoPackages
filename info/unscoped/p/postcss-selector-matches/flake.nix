{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-selector-matches?rev=25-a2ffe9b7ed002ea530aa64eb67a1637f";
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
    ident = "postcss-selector-matches";
    ldir  = "info/unscoped/p/postcss-selector-matches";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
