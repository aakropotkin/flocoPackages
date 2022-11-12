{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/protocol-http?_rev=101-64164701ccdcac2b3ea6804a95d1d5c9";
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
    ident = "@aws-sdk/protocol-http";
    ldir  = "info/aws-sdk/protocol-http";
    inherit packument fetchInfo;
  } // latest';

}
