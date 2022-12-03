{

  inputs.packument.url   = "https://registry.npmjs.org/@csstools/postcss-stepped-value-functions";
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
    scope = "@csstools";
    ident = "@csstools/postcss-stepped-value-functions";
    ldir  = "info/csstools/postcss-stepped-value-functions";
    inherit packument fetchInfo;
  } // latest';

}
