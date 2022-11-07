{

  inputs.packument.url   = "https://registry.npmjs.org/emojis-list?rev=15-9bb4bf27fd93465143c833d3074e927e";
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
    scope = null;
    ident = "emojis-list";
    ldir  = "info/unscoped/e/emojis-list";
    inherit packument fetchInfo;
  } // latest';

}
