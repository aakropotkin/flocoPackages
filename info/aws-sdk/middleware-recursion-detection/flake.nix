{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/middleware-recursion-detection?rev=20-59f695b7d8b2fee5103bbdd3e023cedb";
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
    ident = "@aws-sdk/middleware-recursion-detection";
    ldir  = "info/aws-sdk/middleware-recursion-detection";
    inherit packument fetchInfo;
  } // latest';

}
