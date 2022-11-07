{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-normalize-whitespace?rev=39-e865809897c755e05f69f2d5e1f61514";
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
    ident = "postcss-normalize-whitespace";
    ldir  = "info/unscoped/p/postcss-normalize-whitespace";
    inherit packument fetchInfo;
  } // latest';

}
