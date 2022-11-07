{

  inputs.packument.url   = "https://registry.npmjs.org/vue-class-component?rev=60-facd44bcf9a13d91a3d548052f82ab6b";
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
    ident = "vue-class-component";
    ldir  = "info/unscoped/v/vue-class-component";
    inherit packument fetchInfo;
  } // latest';

}
