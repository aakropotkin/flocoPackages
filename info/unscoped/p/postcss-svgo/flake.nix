{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-svgo?rev=62-2a9ab8947edad4e0bb1776a121ea8b7a";
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
    ident = "postcss-svgo";
    ldir  = "info/unscoped/p/postcss-svgo";
    inherit packument fetchInfo;
  } // latest';

}
