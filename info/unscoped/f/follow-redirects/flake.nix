{

  inputs.packument.url   = "https://registry.npmjs.org/follow-redirects?rev=82-74f7d3c839f1bfbbb8c8b0f58deed662";
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
    ident = "follow-redirects";
    ldir  = "info/unscoped/f/follow-redirects";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
