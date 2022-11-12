{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools/postcss-oklab-function?_rev=5-acb75e2b7ce58a3c5e9f8b30cb2ef414";
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
    ident = "@csstools/postcss-oklab-function";
    ldir  = "info/csstools/postcss-oklab-function";
    inherit packument fetchInfo;
  } // latest';

}
