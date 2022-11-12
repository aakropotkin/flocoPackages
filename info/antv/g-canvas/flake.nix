{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv%2fg-canvas?_rev=275-eb3b5be4525e5e5af6221e360e8e05ec";
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
    ident = "@antv/g-canvas";
    ldir  = "info/antv/g-canvas";
    inherit packument fetchInfo;
  } // latest';

}
