{

  inputs.packument.url   = "https://registry.npmjs.org/vue-hot-reload-api?rev=44-30ea99a4d96242d5d80497d9ac1e1eae";
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
    ident = "vue-hot-reload-api";
    ldir  = "info/unscoped/v/vue-hot-reload-api";
    inherit packument fetchInfo;
  } // latest';

}
