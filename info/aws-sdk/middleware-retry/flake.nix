{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fmiddleware-retry?_rev=125-2c182dff9e1dd263055b73e426608678";
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
    ident = "@aws-sdk/middleware-retry";
    ldir  = "info/aws-sdk/middleware-retry";
    inherit packument fetchInfo;
  } // latest';

}
