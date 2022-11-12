{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2futil-hex-encoding?_rev=68-bd06878b4978e38fb1258cfa89f8b677";
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
    ident = "@aws-sdk/util-hex-encoding";
    ldir  = "info/aws-sdk/util-hex-encoding";
    inherit packument fetchInfo;
  } // latest';

}
