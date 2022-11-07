{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/middleware-logger?rev=83-514345b1d18633ce8e0bffc76a39fc98";
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
    ident = "@aws-sdk/middleware-logger";
    ldir  = "info/aws-sdk/middleware-logger";
    inherit packument fetchInfo;
  } // latest';

}
