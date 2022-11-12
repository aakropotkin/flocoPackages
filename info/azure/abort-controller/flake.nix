{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/abort-controller?_rev=156-3745d2f4decd35b03e2963072b6cf2b0";
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
    scope = "@azure";
    ident = "@azure/abort-controller";
    ldir  = "info/azure/abort-controller";
    inherit packument fetchInfo;
  } // latest';

}
