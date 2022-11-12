{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fmiddleware-endpoint?_rev=12-9f3d01a91aab53fe3c5e0f14e91238aa";
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
    scope = "@aws-sdk";
    ident = "@aws-sdk/middleware-endpoint";
    ldir  = "info/aws-sdk/middleware-endpoint";
    inherit packument fetchInfo;
  } // latest';

}
