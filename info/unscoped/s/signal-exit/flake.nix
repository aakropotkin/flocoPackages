{

  inputs.packument.url   = "https://registry.npmjs.org/signal-exit?rev=37-f3a1fa161a79fe1bc485dd0d509c841f";
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
    ident = "signal-exit";
    ldir  = "info/unscoped/s/signal-exit";
    inherit packument fetchInfo;
  } // latest';

}
