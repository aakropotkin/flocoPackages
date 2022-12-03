{

  inputs.packument.url   = "https://registry.npmjs.org/@vue/reactivity";
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
    scope = "@vue";
    ident = "@vue/reactivity";
    ldir  = "info/vue/reactivity";
    inherit packument fetchInfo;
  } // latest';

}
