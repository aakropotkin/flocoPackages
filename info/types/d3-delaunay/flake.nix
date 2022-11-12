{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/d3-delaunay?_rev=529-3dc3d8195b8c0b14bf70b2acb7219edd";
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
    scope = "@types";
    ident = "@types/d3-delaunay";
    ldir  = "info/types/d3-delaunay";
    inherit packument fetchInfo;
  } // latest';

}
