{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/middleware-stack?_rev=112-0c829be023bc78b9612670b9a97d5c68";
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
    ident = "@aws-sdk/middleware-stack";
    ldir  = "info/aws-sdk/middleware-stack";
    inherit packument fetchInfo;
  } // latest';

}
