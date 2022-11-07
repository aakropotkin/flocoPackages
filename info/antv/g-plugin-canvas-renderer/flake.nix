{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/g-plugin-canvas-renderer?rev=157-e7899531d17d48510f02342de698e37d";
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
    scope = "@antv";
    ident = "@antv/g-plugin-canvas-renderer";
    ldir  = "info/antv/g-plugin-canvas-renderer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
