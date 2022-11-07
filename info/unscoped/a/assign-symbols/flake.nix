{

  inputs.packument.url   = "https://registry.npmjs.org/assign-symbols?rev=11-ea777bc300d341c8deffbf3f9fc50d8d";
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
    ident = "assign-symbols";
    ldir  = "info/unscoped/a/assign-symbols";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
