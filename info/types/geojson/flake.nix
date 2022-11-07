{

  inputs.packument.url   = "https://registry.npmjs.org/@types/geojson?rev=617-70bfcf48bfe0e882a048066802c3c4b3";
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
    ident = "@types/geojson";
    ldir  = "info/types/geojson";
    inherit packument fetchInfo;
  } // latest';

}
