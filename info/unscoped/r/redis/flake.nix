{

  inputs.packument.url   = "https://registry.npmjs.org/redis?rev=755-e82f8d6661a38062ad8f22e4c3ecbd7d";
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
    ident = "redis";
    ldir  = "info/unscoped/r/redis";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
