{

  inputs.packument.url   = "https://registry.npmjs.org/react-dnd-html5-backend";
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
    ident = "react-dnd-html5-backend";
    ldir  = "info/unscoped/r/react-dnd-html5-backend";
    inherit packument fetchInfo;
  } // latest';

}
