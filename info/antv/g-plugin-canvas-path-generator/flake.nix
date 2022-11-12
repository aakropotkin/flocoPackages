{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv%2fg-plugin-canvas-path-generator?_rev=49-5bb149bb919a187f80d94acc36c05eb3";
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
    ident = "@antv/g-plugin-canvas-path-generator";
    ldir  = "info/antv/g-plugin-canvas-path-generator";
    inherit packument fetchInfo;
  } // latest';

}
