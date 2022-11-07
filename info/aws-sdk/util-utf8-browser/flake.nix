{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/util-utf8-browser?rev=66-aa5a3c9dd44c5d81bed70d22d17aa89f";
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
    ident = "@aws-sdk/util-utf8-browser";
    ldir  = "info/aws-sdk/util-utf8-browser";
    inherit packument fetchInfo;
  } // latest';

}
