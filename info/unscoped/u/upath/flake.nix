{

  inputs.packument.url   = "https://registry.npmjs.org/upath?rev=41-ef20d3205d8de8c2d3d2885d84c98419";
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
    ident = "upath";
    ldir  = "info/unscoped/u/upath";
    inherit packument fetchInfo;
  } // latest';

}
