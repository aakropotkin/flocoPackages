{

  inputs.packument.url   = "https://registry.npmjs.org/d3-contour?rev=20-6b026a12d2e14233ed89713a8b06cf7e";
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
    ident = "d3-contour";
    ldir  = "info/unscoped/d/d3-contour";
    inherit packument fetchInfo;
  } // latest';

}
