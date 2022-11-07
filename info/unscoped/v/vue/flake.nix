{

  inputs.packument.url   = "https://registry.npmjs.org/vue?rev=935-730ed4e1733aa588e6ad7a6d9aae465d";
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
    ident = "vue";
    ldir  = "info/unscoped/v/vue";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
