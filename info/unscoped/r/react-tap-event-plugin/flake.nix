{

  inputs.packument.url   = "https://registry.npmjs.org/react-tap-event-plugin?rev=57-d5027106cb07ae6e1e988d97898a3b4c";
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
    ident = "react-tap-event-plugin";
    ldir  = "info/unscoped/r/react-tap-event-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
