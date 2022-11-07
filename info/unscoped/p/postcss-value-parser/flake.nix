{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-value-parser?rev=40-02996fbc70f2b7e570f400b9103309b0";
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
    ident = "postcss-value-parser";
    ldir  = "info/unscoped/p/postcss-value-parser";
    inherit packument fetchInfo;
  } // latest';

}
