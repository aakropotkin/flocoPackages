{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2futil-body-length-browser?_rev=67-b2548049474fe71b21ae4c291927dda2";
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
    ident = "@aws-sdk/util-body-length-browser";
    ldir  = "info/aws-sdk/util-body-length-browser";
    inherit packument fetchInfo;
  } // latest';

}
