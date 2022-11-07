{

  inputs.packument.url   = "https://registry.npmjs.org/scroll-into-view-if-needed?rev=80-e5cf72bc7a902883f5a17c9f1bea4056";
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
    ident = "scroll-into-view-if-needed";
    ldir  = "info/unscoped/s/scroll-into-view-if-needed";
    inherit packument fetchInfo;
  } // latest';

}
