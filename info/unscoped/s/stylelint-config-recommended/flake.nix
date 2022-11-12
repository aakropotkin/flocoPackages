{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stylelint-config-recommended?_rev=24-ea4211d7e88461234c04633a8d41c554";
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
    ident = "stylelint-config-recommended";
    ldir  = "info/unscoped/s/stylelint-config-recommended";
    inherit packument fetchInfo;
  } // latest';

}
