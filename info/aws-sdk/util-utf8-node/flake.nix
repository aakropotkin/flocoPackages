{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2futil-utf8-node?_rev=71-78bc06b06f6ef6f9360913d0df046b86";
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
    ident = "@aws-sdk/util-utf8-node";
    ldir  = "info/aws-sdk/util-utf8-node";
    inherit packument fetchInfo;
  } // latest';

}
