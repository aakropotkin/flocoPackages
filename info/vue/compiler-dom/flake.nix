{

  inputs.packument.url   = "https://registry.npmjs.org/@vue/compiler-dom?rev=134-6500b12262f8171e835af4560f0b03f4";
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
    ident = "@vue/compiler-dom";
    ldir  = "info/vue/compiler-dom";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
