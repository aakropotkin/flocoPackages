{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/joycon?_rev=26-60c4bd26016bf56267165d027aec24c2";
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
    ident = "joycon";
    ldir  = "info/unscoped/j/joycon";
    inherit packument fetchInfo;
  } // latest';

}
