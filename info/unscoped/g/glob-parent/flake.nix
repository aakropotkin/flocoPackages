{

  inputs.packument.url   = "https://registry.npmjs.org/glob-parent?rev=31-eccf3d3649d022693e14e669078ed9b0";
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
    ident = "glob-parent";
    ldir  = "info/unscoped/g/glob-parent";
    inherit packument fetchInfo;
  } // latest';

}
