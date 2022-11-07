{

  inputs.packument.url   = "https://registry.npmjs.org/vuex?rev=135-3038c890c1d650762357bf832fdab10d";
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
    ident = "vuex";
    ldir  = "info/unscoped/v/vuex";
    inherit packument fetchInfo;
  } // latest';

}
