{

  inputs.packument.url   = "https://registry.npmjs.org/vue-eslint-parser?rev=83-23d328137fa0db740506ddcbc8cf21ed";
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
    ident = "vue-eslint-parser";
    ldir  = "info/unscoped/v/vue-eslint-parser";
    inherit packument fetchInfo;
  } // latest';

}
