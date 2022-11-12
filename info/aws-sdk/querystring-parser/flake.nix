{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fquerystring-parser?_rev=107-c596aff44f583df5404a8fe4c2c8a5ca";
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
    ident = "@aws-sdk/querystring-parser";
    ldir  = "info/aws-sdk/querystring-parser";
    inherit packument fetchInfo;
  } // latest';

}
