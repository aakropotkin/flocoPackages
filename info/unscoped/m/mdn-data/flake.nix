{

  inputs.packument.url   = "https://registry.npmjs.org/mdn-data?rev=47-0e2d3dc8b418ae6574dae6a1184dee9e";
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
    ident = "mdn-data";
    ldir  = "info/unscoped/m/mdn-data";
    inherit packument fetchInfo;
  } // latest';

}
