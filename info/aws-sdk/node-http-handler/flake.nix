{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/node-http-handler?rev=125-66865502aa14b5c4627354e3ae43af60";
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
    ident = "@aws-sdk/node-http-handler";
    ldir  = "info/aws-sdk/node-http-handler";
    inherit packument fetchInfo;
  } // latest';

}
