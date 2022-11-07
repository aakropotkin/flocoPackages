{

  inputs.packument.url   = "https://registry.npmjs.org/@csstools/postcss-trigonometric-functions?rev=2-1dc0ecd2f484723f50f566f2945bdd0e";
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
    ident = "@csstools/postcss-trigonometric-functions";
    ldir  = "info/csstools/postcss-trigonometric-functions";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
