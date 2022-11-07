{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/middleware-sdk-sts?rev=70-83d60560556ab132ab672b26293b8ff0";
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
    ident = "@aws-sdk/middleware-sdk-sts";
    ldir  = "info/aws-sdk/middleware-sdk-sts";
    inherit packument fetchInfo;
  } // latest';

}
