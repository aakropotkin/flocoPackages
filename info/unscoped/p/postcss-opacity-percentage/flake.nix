{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-opacity-percentage?_rev=7-43eb2873f0843fcddc63796d99934d82";
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
    ident = "postcss-opacity-percentage";
    ldir  = "info/unscoped/p/postcss-opacity-percentage";
    inherit packument fetchInfo;
  } // latest';

}
