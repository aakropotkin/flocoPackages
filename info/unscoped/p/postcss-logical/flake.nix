{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-logical?rev=18-a1330c17e37ac9319af700bc77d2eeb6";
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
    ident = "postcss-logical";
    ldir  = "info/unscoped/p/postcss-logical";
    inherit packument fetchInfo;
  } // latest';

}
