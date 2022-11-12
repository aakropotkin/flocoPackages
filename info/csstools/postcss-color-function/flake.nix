{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools/postcss-color-function?_rev=6-0fcaa2458bd6a74eaf37796b2aff9044";
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
    ident = "@csstools/postcss-color-function";
    ldir  = "info/csstools/postcss-color-function";
    inherit packument fetchInfo;
  } // latest';

}
