{

  inputs.packument.url   = "https://registry.npmjs.org/react-dnd-touch-backend?rev=79-ddca86e11f74a9b2cfd5433261e53664";
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
    ident = "react-dnd-touch-backend";
    ldir  = "info/unscoped/r/react-dnd-touch-backend";
    inherit packument fetchInfo;
  } // latest';

}
