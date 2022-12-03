{

  inputs.packument.url   = "https://registry.npmjs.org/@intlify/vue-devtools";
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
    scope = "@intlify";
    ident = "@intlify/vue-devtools";
    ldir  = "info/intlify/vue-devtools";
    inherit packument fetchInfo;
  } // latest';

}
