{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fcredential-provider-env?_rev=116-1aebf5c586e44aaaf1d095b5dc9ca97c";
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
    ident = "@aws-sdk/credential-provider-env";
    ldir  = "info/aws-sdk/credential-provider-env";
    inherit packument fetchInfo;
  } // latest';

}
