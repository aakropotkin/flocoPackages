{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/url-parser?_rev=60-9e2c424241cfd83fd3c14340598e03d5";
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
    ident = "@aws-sdk/url-parser";
    ldir  = "info/aws-sdk/url-parser";
    inherit packument fetchInfo;
  } // latest';

}
