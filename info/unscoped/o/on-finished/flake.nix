{

  inputs.packument.url   = "https://registry.npmjs.org/on-finished?rev=43-4cfc3b25e23404e74441a43899eb7cb9";
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
    ident = "on-finished";
    ldir  = "info/unscoped/o/on-finished";
    inherit packument fetchInfo;
  } // latest';

}
