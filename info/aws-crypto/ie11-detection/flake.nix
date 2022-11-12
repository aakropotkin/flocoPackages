{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-crypto%2fie11-detection?_rev=20-5286f604549fa2bbb248b130ade0b52b";
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
    ident = "@aws-crypto/ie11-detection";
    ldir  = "info/aws-crypto/ie11-detection";
    inherit packument fetchInfo;
  } // latest';

}
