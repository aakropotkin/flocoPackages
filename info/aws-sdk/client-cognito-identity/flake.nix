{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/client-cognito-identity?rev=206-8c4bbd491f81666d31d41e02820e2a49";
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
    ident = "@aws-sdk/client-cognito-identity";
    ldir  = "info/aws-sdk/client-cognito-identity";
    inherit packument fetchInfo;
  } // latest';

}
