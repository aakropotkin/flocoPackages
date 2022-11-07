{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-sorting?rev=36-8d10a9bb4ee26c01f61faffc72eb1137";
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
    ident = "postcss-sorting";
    ldir  = "info/unscoped/p/postcss-sorting";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
