{

  inputs.packument.url   = "https://registry.npmjs.org/oauth-sign?rev=26-30730e3f7e611630bdb32e617bab8c25";
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
    ident = "oauth-sign";
    ldir  = "info/unscoped/o/oauth-sign";
    inherit packument fetchInfo;
  } // latest';

}
