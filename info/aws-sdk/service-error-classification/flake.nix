{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fservice-error-classification?_rev=104-b6b37f3bf12200aac8938cc479bfed48";
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
    ident = "@aws-sdk/service-error-classification";
    ldir  = "info/aws-sdk/service-error-classification";
    inherit packument fetchInfo;
  } // latest';

}
