{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/util-locate-window?rev=66-33011bc04426350d6483de3d0e12dd39";
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
    ident = "@aws-sdk/util-locate-window";
    ldir  = "info/aws-sdk/util-locate-window";
    inherit packument fetchInfo;
  } // latest';

}
