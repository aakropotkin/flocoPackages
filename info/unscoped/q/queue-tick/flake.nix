{

  inputs.packument.url   = "https://registry.npmjs.org/queue-tick?rev=2-5b645298f326923721f280d3d52b6553";
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
    ident = "queue-tick";
    ldir  = "info/unscoped/q/queue-tick";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
