{

  inputs.packument.url   = "https://registry.npmjs.org/apollo-cache-inmemory?rev=174-08de31362cd2e640c650230f6b10c82f";
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
    ident = "apollo-cache-inmemory";
    ldir  = "info/unscoped/a/apollo-cache-inmemory";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
