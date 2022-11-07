{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/client-sts?rev=194-0a87be317ab68e02ccb0a6f0e49e5d9b";
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
    ident = "@aws-sdk/client-sts";
    ldir  = "info/aws-sdk/client-sts";
    inherit packument fetchInfo;
  } // latest';

}
