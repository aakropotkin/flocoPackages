{

  inputs.packument.url   = "https://registry.npmjs.org/rgb-hex?rev=13-a102ee706b13f90f32ccdc573de8a71d";
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
    ident = "rgb-hex";
    ldir  = "info/unscoped/r/rgb-hex";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
