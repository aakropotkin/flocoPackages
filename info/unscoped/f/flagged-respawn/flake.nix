{

  inputs.packument.url   = "https://registry.npmjs.org/flagged-respawn?rev=26-063ebce9aea210bda4eb25636f586ca3";
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
    ident = "flagged-respawn";
    ldir  = "info/unscoped/f/flagged-respawn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
