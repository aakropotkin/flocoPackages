{

  inputs.packument.url   = "https://registry.npmjs.org/color-convert?rev=79-47dcf2d3588dc00ead8dc1d6131e6d88";
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
    ident = "color-convert";
    ldir  = "info/unscoped/c/color-convert";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
