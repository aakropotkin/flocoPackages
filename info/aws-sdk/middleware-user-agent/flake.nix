{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/middleware-user-agent?rev=104-05890d951b8500fae1d04382995069ed";
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
    ident = "@aws-sdk/middleware-user-agent";
    ldir  = "info/aws-sdk/middleware-user-agent";
    inherit packument fetchInfo;
  } // latest';

}
