{

  inputs.packument.url   = "https://registry.npmjs.org/d3-delaunay?rev=45-d703e1ff5f3c8efe95c4bdf972ff86cd";
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
    ident = "d3-delaunay";
    ldir  = "info/unscoped/d/d3-delaunay";
    inherit packument fetchInfo;
  } // latest';

}
