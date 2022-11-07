{

  inputs.packument.url   = "https://registry.npmjs.org/cids?rev=51-e2e86a93e112d4a7fdcb7e7cfe21fb25";
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
    ident = "cids";
    ldir  = "info/unscoped/c/cids";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
