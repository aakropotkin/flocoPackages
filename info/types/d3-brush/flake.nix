{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-brush?rev=625-de895eba814738ba1584b27d8aed53e1";
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
    ident = "@types/d3-brush";
    ldir  = "info/types/d3-brush";
    inherit packument fetchInfo;
  } // latest';

}
