{

  inputs.packument.url   = "https://registry.npmjs.org/@vue/server-renderer?rev=129-44e42900326e8266efeac33ccb6a756f";
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
    ident = "@vue/server-renderer";
    ldir  = "info/vue/server-renderer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
