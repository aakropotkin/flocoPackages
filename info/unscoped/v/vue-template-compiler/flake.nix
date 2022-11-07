{

  inputs.packument.url   = "https://registry.npmjs.org/vue-template-compiler?rev=174-a49b28c663d06a5298b506d2fe51c57f";
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
    ident = "vue-template-compiler";
    ldir  = "info/unscoped/v/vue-template-compiler";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
