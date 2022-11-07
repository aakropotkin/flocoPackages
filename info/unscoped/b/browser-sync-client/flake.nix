{

  inputs.packument.url   = "https://registry.npmjs.org/browser-sync-client?rev=116-1b48651d786f601af0490cc2d0493406";
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
    ident = "browser-sync-client";
    ldir  = "info/unscoped/b/browser-sync-client";
    inherit packument fetchInfo;
  } // latest';

}
