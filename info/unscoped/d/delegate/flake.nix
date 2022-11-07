{

  inputs.packument.url   = "https://registry.npmjs.org/delegate?rev=40-ef5def71fd3db0ac8b89b7feecb63abd";
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
    ident = "delegate";
    ldir  = "info/unscoped/d/delegate";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
