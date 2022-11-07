{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-scale?rev=762-df355b2124ee2938e38af21bf42613e1";
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
    ident = "@types/d3-scale";
    ldir  = "info/types/d3-scale";
    inherit packument fetchInfo;
  } // latest';

}
