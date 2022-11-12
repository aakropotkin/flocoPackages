{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure%2fcore-client?_rev=113-3eafd18f6f8bb70bf8a15948b1c0f120";
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
    ident = "@azure/core-client";
    ldir  = "info/azure/core-client";
    inherit packument fetchInfo;
  } // latest';

}
