{

  inputs.packument.url   = "https://registry.npmjs.org/@vue/compiler-ssr?rev=130-f48de9daecfd492a4d7ab79de45225d4";
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
    ident = "@vue/compiler-ssr";
    ldir  = "info/vue/compiler-ssr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
