{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/signature-v4?rev=128-074fdf1888c2c8d59f504b9bf241346a";
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
    ident = "@aws-sdk/signature-v4";
    ldir  = "info/aws-sdk/signature-v4";
    inherit packument fetchInfo;
  } // latest';

}
