{

  inputs.packument.url   = "https://registry.npmjs.org/aws-sdk?rev=1928-0bda384b96b4af86ff42a729220f5be6";
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
    scope = null;
    ident = "aws-sdk";
    ldir  = "info/unscoped/a/aws-sdk";
    inherit packument fetchInfo;
  } // latest';

}
