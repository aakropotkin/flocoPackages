{

  inputs.packument.url   = "https://registry.npmjs.org/micromark?rev=44-2735f31ff2281ab0d569e21322fc3b2a";
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
    ident = "micromark";
    ldir  = "info/unscoped/m/micromark";
    inherit packument fetchInfo;
  } // latest';

}
