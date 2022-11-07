{

  inputs.packument.url   = "https://registry.npmjs.org/react-split?rev=20-27f9ab9d3a38db7fe6e055b2637ed4bf";
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
    ident = "react-split";
    ldir  = "info/unscoped/r/react-split";
    inherit packument fetchInfo;
  } // latest';

}
