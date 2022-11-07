{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/credential-provider-ini?rev=173-13b56509d964e13418325917f2632340";
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
    ident = "@aws-sdk/credential-provider-ini";
    ldir  = "info/aws-sdk/credential-provider-ini";
    inherit packument fetchInfo;
  } // latest';

}
