{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-contour?_rev=565-bcfc42a4481e98fdf0e7b0c318126530";
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
    ident = "@types/d3-contour";
    ldir  = "info/types/d3-contour";
    inherit packument fetchInfo;
  } // latest';

}
