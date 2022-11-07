{

  inputs.packument.url   = "https://registry.npmjs.org/@vue/compiler-sfc?rev=175-7a96475757bca143afd1f9529aa6bce0";
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
    ident = "@vue/compiler-sfc";
    ldir  = "info/vue/compiler-sfc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
