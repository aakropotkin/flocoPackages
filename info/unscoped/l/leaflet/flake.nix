{

  inputs.packument.url   = "https://registry.npmjs.org/leaflet?rev=116-08ae4eef79c7f317e27246bacc0e8258";
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
    ident = "leaflet";
    ldir  = "info/unscoped/l/leaflet";
    inherit packument fetchInfo;
  } // latest';

}
