{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fnode-config-provider?_rev=99-cbb74a5689950d436bf74fa4f09b2b75";
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
    ident = "@aws-sdk/node-config-provider";
    ldir  = "info/aws-sdk/node-config-provider";
    inherit packument fetchInfo;
  } // latest';

}
