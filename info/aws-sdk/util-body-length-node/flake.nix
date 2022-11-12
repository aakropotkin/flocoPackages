{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk/util-body-length-node?_rev=70-165204a02411594423213f837ef67605";
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
    ident = "@aws-sdk/util-body-length-node";
    ldir  = "info/aws-sdk/util-body-length-node";
    inherit packument fetchInfo;
  } // latest';

}
