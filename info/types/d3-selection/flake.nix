{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-selection?rev=697-72d773452d8565d04732e0b118c3ddaf";
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
    ident = "@types/d3-selection";
    ldir  = "info/types/d3-selection";
    inherit packument fetchInfo;
  } // latest';

}
