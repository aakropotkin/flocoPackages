{

  inputs.packument.url   = "https://registry.npmjs.org/@types/react-measure?rev=435-65deb9b515b7b0e1c5bff4cf7414137f";
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
    ident = "@types/react-measure";
    ldir  = "info/types/react-measure";
    inherit packument fetchInfo;
  } // latest';

}
