{

  inputs.packument.url   = "https://registry.npmjs.org/@phosphor/keyboard?rev=22-f650bf429e9123459262a98e55a6294b";
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
    ident = "@phosphor/keyboard";
    ldir  = "info/phosphor/keyboard";
    inherit packument fetchInfo;
  } // latest';

}
