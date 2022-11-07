{

  inputs.packument.url   = "https://registry.npmjs.org/react-dnd-html5-backend?rev=103-22b35f1302a35c277fcaa57943d0e4d4";
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
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
