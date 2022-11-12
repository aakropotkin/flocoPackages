{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-crypto/sha256-js?_rev=24-cf48ca3000220b73e6f0bf731bd74adf";
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
    ident = "@aws-crypto/sha256-js";
    ldir  = "info/aws-crypto/sha256-js";
    inherit packument fetchInfo;
  } // latest';

}
