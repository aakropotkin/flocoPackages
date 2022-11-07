{

  inputs.packument.url   = "https://registry.npmjs.org/vue-i18n?rev=430-2477655ed8808f9f24df824a4d691a60";
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
    ident = "vue-i18n";
    ldir  = "info/unscoped/v/vue-i18n";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
