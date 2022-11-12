{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-new-target?_rev=81-931f83444508b0aacf8babf4bd4c2f94";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-new-target";
    ldir  = "info/babel/plugin-transform-new-target";
    inherit packument fetchInfo;
  } // latest';

}
