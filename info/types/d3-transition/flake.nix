{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-transition?_rev=668-42e1d3d646531e4738328488a7acdefd";
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
    ident = "@types/d3-transition";
    ldir  = "info/types/d3-transition";
    inherit packument fetchInfo;
  } // latest';

}
