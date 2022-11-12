{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/timers-browserify?_rev=57-1ed0f1402177159723efcebf0b2c311a";
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
    ident = "timers-browserify";
    ldir  = "info/unscoped/t/timers-browserify";
    inherit packument fetchInfo;
  } // latest';

}
