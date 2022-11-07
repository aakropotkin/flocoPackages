{

  inputs.packument.url   = "https://registry.npmjs.org/node-abort-controller?rev=12-badf3641bb18a2e8b302422fcdbd0931";
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
    ident = "node-abort-controller";
    ldir  = "info/unscoped/n/node-abort-controller";
    inherit packument fetchInfo;
  } // latest';

}
