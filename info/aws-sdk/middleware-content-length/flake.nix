{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/middleware-content-length?_rev=114-9450740d577886a2a8fbd687808e90c0";
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
    ident = "@aws-sdk/middleware-content-length";
    ldir  = "info/aws-sdk/middleware-content-length";
    inherit packument fetchInfo;
  } // latest';

}
