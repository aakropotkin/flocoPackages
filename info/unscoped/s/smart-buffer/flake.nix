{

  inputs.packument.url   = "https://registry.npmjs.org/smart-buffer?rev=43-fbd74e056a4cd20f7dfc22d3d32058db";
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
    ident = "smart-buffer";
    ldir  = "info/unscoped/s/smart-buffer";
    inherit packument fetchInfo;
  } // latest';

}
