{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@vue/runtime-core?_rev=134-8276ac454043462cc29954f38cd089fe";
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
    ident = "@vue/runtime-core";
    ldir  = "info/vue/runtime-core";
    inherit packument fetchInfo;
  } // latest';

}
