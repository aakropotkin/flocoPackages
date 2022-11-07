{

  inputs.packument.url   = "https://registry.npmjs.org/@phosphor/widgets?rev=64-48056436c7e76381dab0ae1f8b983c8d";
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
    scope = "@phosphor";
    ident = "@phosphor/widgets";
    ldir  = "info/phosphor/widgets";
    inherit packument fetchInfo;
  } // latest';

}
