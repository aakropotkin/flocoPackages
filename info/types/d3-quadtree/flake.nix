{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-quadtree?_rev=556-504287e0c28491a45b9fc37006b8070e";
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
    ident = "@types/d3-quadtree";
    ldir  = "info/types/d3-quadtree";
    inherit packument fetchInfo;
  } // latest';

}
