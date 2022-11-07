{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-convert-values?rev=77-6361bb7285be8dfc63a1651a29d8d2b3";
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
    ident = "postcss-convert-values";
    ldir  = "info/unscoped/p/postcss-convert-values";
    inherit packument fetchInfo;
  } // latest';

}
