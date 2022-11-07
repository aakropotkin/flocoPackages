{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/util-defaults-mode-node?rev=52-d0616c8430ca037396a1774db69a687e";
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
    ident = "@aws-sdk/util-defaults-mode-node";
    ldir  = "info/aws-sdk/util-defaults-mode-node";
    inherit packument fetchInfo;
  } // latest';

}
