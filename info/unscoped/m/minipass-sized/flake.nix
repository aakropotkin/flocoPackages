{

  inputs.packument.url   = "https://registry.npmjs.org/minipass-sized?rev=4-fe87ca1f0f48e40782c57e220d3d5f27";
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
    ident = "minipass-sized";
    ldir  = "info/unscoped/m/minipass-sized";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
