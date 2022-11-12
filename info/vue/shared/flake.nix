{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@vue/shared?_rev=124-dc4bc8a0579acfc4d0f64bb5d3820ab1";
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
    ident = "@vue/shared";
    ldir  = "info/vue/shared";
    inherit packument fetchInfo;
  } // latest';

}
