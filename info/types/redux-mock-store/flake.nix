{

  inputs.packument.url   = "https://registry.npmjs.org/@types/redux-mock-store?rev=496-154d49c720683a93c294ed2543f3d23f";
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
    ident = "@types/redux-mock-store";
    ldir  = "info/types/redux-mock-store";
    inherit packument fetchInfo;
  } // latest';

}
