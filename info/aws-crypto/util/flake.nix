{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-crypto/util?_rev=7-2cd611559e3b58889d4d8a9277734b88";
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
    scope = "@aws-crypto";
    ident = "@aws-crypto/util";
    ldir  = "info/aws-crypto/util";
    inherit packument fetchInfo;
  } // latest';

}
