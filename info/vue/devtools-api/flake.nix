{

  inputs.packument.url   = "https://registry.npmjs.org/@vue/devtools-api?rev=52-97eb1880b3f8adaa3a8058888d5ec8e4";
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
    ident = "@vue/devtools-api";
    ldir  = "info/vue/devtools-api";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
