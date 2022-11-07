{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-shape?rev=754-90fc990edca578379b1651521850ab99";
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
    ident = "@types/d3-shape";
    ldir  = "info/types/d3-shape";
    inherit packument fetchInfo;
  } // latest';

}
