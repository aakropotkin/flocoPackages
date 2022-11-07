{

  inputs.packument.url   = "https://registry.npmjs.org/core-js?rev=403-be4dacef8f3ebef856e8b6ebe03ed2d6";
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
    ident = "core-js";
    ldir  = "info/unscoped/c/core-js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
