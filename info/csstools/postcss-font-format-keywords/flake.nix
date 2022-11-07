{

  inputs.packument.url   = "https://registry.npmjs.org/@csstools/postcss-font-format-keywords?rev=2-da67832ca2566a5cf62aae4f4558e2d1";
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
    ident = "@csstools/postcss-font-format-keywords";
    ldir  = "info/csstools/postcss-font-format-keywords";
    inherit packument fetchInfo;
  } // latest';

}
