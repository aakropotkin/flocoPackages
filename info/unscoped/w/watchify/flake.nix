{

  inputs.packument.url   = "https://registry.npmjs.org/watchify?rev=322-caf729d02caf426089cd0174c8fd3e2f";
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
    ident = "watchify";
    ldir  = "info/unscoped/w/watchify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
