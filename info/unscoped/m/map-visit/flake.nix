{

  inputs.packument.url   = "https://registry.npmjs.org/map-visit?rev=10-f3c055b6897b319f974a6e01b69e481c";
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
    ident = "map-visit";
    ldir  = "info/unscoped/m/map-visit";
    inherit packument fetchInfo;
  } // latest';

}
