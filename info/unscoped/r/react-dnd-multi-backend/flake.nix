{

  inputs.packument.url   = "https://registry.npmjs.org/react-dnd-multi-backend?rev=90-77ca3b903201a614b3f32cacc688e0ef";
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
    ident = "react-dnd-multi-backend";
    ldir  = "info/unscoped/r/react-dnd-multi-backend";
    inherit packument fetchInfo;
  } // latest';

}
