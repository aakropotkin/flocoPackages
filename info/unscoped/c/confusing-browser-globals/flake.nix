{

  inputs.packument.url   = "https://registry.npmjs.org/confusing-browser-globals?rev=50-4ad6eccf0c85f66f32157ea7d799bc15";
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
    ident = "confusing-browser-globals";
    ldir  = "info/unscoped/c/confusing-browser-globals";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
