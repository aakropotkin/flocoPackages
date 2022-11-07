{

  inputs.packument.url   = "https://registry.npmjs.org/deps-sort?rev=82-0bdd81a1d26ff86e4ce60b898a75cf13";
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
    ident = "deps-sort";
    ldir  = "info/unscoped/d/deps-sort";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
