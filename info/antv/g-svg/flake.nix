{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv%2fg-svg?_rev=246-97ccc311f67aacddb646d1fc84e788bb";
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
    ident = "@antv/g-svg";
    ldir  = "info/antv/g-svg";
    inherit packument fetchInfo;
  } // latest';

}
