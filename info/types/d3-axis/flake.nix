{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-axis?rev=589-c854a352bbc277e72a43961d5de7857d";
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
    ident = "@types/d3-axis";
    ldir  = "info/types/d3-axis";
    inherit packument fetchInfo;
  } // latest';

}
