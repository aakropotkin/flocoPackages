{

  inputs.packument.url   = "https://registry.npmjs.org/cluster-key-slot?rev=19-93d7d4659ac419652fbced3d2fabd517";
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
    ident = "cluster-key-slot";
    ldir  = "info/unscoped/c/cluster-key-slot";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
