{

  inputs.packument.url   = "https://registry.npmjs.org/subtext?rev=122-c5f34eff623183638e75c31e67c5a47c";
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
    ident = "subtext";
    ldir  = "info/unscoped/s/subtext";
    inherit packument fetchInfo;
  } // latest';

}
