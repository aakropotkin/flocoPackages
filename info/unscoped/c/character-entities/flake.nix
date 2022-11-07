{

  inputs.packument.url   = "https://registry.npmjs.org/character-entities?rev=14-19201cf2b3035f31fb070f98e26452a9";
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
    ident = "character-entities";
    ldir  = "info/unscoped/c/character-entities";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
