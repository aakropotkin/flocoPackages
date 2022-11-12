{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cssnano-preset-default?_rev=68-22e3953a6a8d6d1458daf5ccce201e16";
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
    ident = "cssnano-preset-default";
    ldir  = "info/unscoped/c/cssnano-preset-default";
    inherit packument fetchInfo;
  } // latest';

}
