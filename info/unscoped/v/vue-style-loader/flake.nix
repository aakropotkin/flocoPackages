{

  inputs.packument.url   = "https://registry.npmjs.org/vue-style-loader?rev=32-e828f099065f4ca73d9559edf5f1bf52";
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
    ident = "vue-style-loader";
    ldir  = "info/unscoped/v/vue-style-loader";
    inherit packument fetchInfo;
  } // latest';

}
