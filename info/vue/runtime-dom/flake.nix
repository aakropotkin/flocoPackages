{

  inputs.packument.url   = "https://registry.npmjs.org/@vue/runtime-dom?rev=134-68fab2831e4f0b35e755aaa70b427d41";
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
    ident = "@vue/runtime-dom";
    ldir  = "info/vue/runtime-dom";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
