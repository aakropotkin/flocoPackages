{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/abort-controller?rev=108-f13ceabc63933e061333a0db8d34eed4";
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
    ident = "@aws-sdk/abort-controller";
    ldir  = "info/aws-sdk/abort-controller";
    inherit packument fetchInfo;
  } // latest';

}
