{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2futil-endpoints?_rev=23-f3582d5822973cb95612329c386bac2c";
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
    ident = "@aws-sdk/util-endpoints";
    ldir  = "info/aws-sdk/util-endpoints";
    inherit packument fetchInfo;
  } // latest';

}
