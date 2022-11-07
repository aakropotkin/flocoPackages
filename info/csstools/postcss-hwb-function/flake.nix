{

  inputs.packument.url   = "https://registry.npmjs.org/@csstools/postcss-hwb-function?rev=3-e43617fa1a7646aae650f96d5c16113c";
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
    ident = "@csstools/postcss-hwb-function";
    ldir  = "info/csstools/postcss-hwb-function";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
