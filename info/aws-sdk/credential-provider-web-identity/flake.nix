{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/credential-provider-web-identity?_rev=61-5b6b6af5f6f83073bef19d3fc076b179";
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
    ident = "@aws-sdk/credential-provider-web-identity";
    ldir  = "info/aws-sdk/credential-provider-web-identity";
    inherit packument fetchInfo;
  } // latest';

}
