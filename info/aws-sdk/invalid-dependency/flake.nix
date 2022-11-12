{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2finvalid-dependency?_rev=84-7c0d90e77f0b8b36718414c3cc4a34c8";
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
    ident = "@aws-sdk/invalid-dependency";
    ldir  = "info/aws-sdk/invalid-dependency";
    inherit packument fetchInfo;
  } // latest';

}
