{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/querystring-builder?_rev=108-f2ae4f0ce856f34a7809f028682193fa";
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
    ident = "@aws-sdk/querystring-builder";
    ldir  = "info/aws-sdk/querystring-builder";
    inherit packument fetchInfo;
  } // latest';

}
