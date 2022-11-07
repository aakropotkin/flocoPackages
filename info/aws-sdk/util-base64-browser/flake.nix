{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/util-base64-browser?rev=67-6f9d969632db64c72c2e86d7e456b406";
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
    ident = "@aws-sdk/util-base64-browser";
    ldir  = "info/aws-sdk/util-base64-browser";
    inherit packument fetchInfo;
  } // latest';

}
