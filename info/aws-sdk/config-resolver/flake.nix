{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fconfig-resolver?_rev=144-1446a041cae06e8e19dd7d4fd1658372";
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
    ident = "@aws-sdk/config-resolver";
    ldir  = "info/aws-sdk/config-resolver";
    inherit packument fetchInfo;
  } // latest';

}
