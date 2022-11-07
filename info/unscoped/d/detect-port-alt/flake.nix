{

  inputs.packument.url   = "https://registry.npmjs.org/detect-port-alt?rev=8-4b6ad2bde62650ceea9b0e55d3d164a3";
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
    ident = "detect-port-alt";
    ldir  = "info/unscoped/d/detect-port-alt";
    inherit packument fetchInfo;
  } // latest';

}
