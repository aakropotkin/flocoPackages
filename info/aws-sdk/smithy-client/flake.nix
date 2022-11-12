{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/smithy-client?_rev=119-8c9daf7e4603d4ab352eb46684376b5b";
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
    ident = "@aws-sdk/smithy-client";
    ldir  = "info/aws-sdk/smithy-client";
    inherit packument fetchInfo;
  } // latest';

}
