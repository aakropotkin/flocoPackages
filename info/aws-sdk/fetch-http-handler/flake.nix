{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/fetch-http-handler?_rev=120-75833e3597432d6b21efc5b8cdcf9617";
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
    ident = "@aws-sdk/fetch-http-handler";
    ldir  = "info/aws-sdk/fetch-http-handler";
    inherit packument fetchInfo;
  } // latest';

}
