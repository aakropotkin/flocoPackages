{

  inputs.packument.url   = "https://registry.npmjs.org/app-root-path?rev=50-422136cd61bbc992df6bd2a9885d1b4d";
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
    ident = "app-root-path";
    ldir  = "info/unscoped/a/app-root-path";
    inherit packument fetchInfo;
  } // latest';

}
