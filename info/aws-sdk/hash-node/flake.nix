{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/hash-node?rev=109-341d542569982213a9453dc1922340d6";
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
    ident = "@aws-sdk/hash-node";
    ldir  = "info/aws-sdk/hash-node";
    inherit packument fetchInfo;
  } // latest';

}
