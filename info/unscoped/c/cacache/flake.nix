{

  inputs.packument.url   = "https://registry.npmjs.org/cacache?rev=132-ea3de20ae81f0fa05c40b6530f7ef448";
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
    ident = "cacache";
    ldir  = "info/unscoped/c/cacache";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
