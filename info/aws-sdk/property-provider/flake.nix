{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/property-provider?_rev=113-620df96e1b601df0c62df881f5af67cd";
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
    ident = "@aws-sdk/property-provider";
    ldir  = "info/aws-sdk/property-provider";
    inherit packument fetchInfo;
  } // latest';

}
