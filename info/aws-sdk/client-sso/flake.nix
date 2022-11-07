{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/client-sso?rev=191-f739f68cb7d87c6be98ca3aed8c95878";
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
    ident = "@aws-sdk/client-sso";
    ldir  = "info/aws-sdk/client-sso";
    inherit packument fetchInfo;
  } // latest';

}
