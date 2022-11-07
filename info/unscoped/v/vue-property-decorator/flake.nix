{

  inputs.packument.url   = "https://registry.npmjs.org/vue-property-decorator?rev=58-fba152660168f2ee223a56f0dbb63a2c";
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
    scope = null;
    ident = "vue-property-decorator";
    ldir  = "info/unscoped/v/vue-property-decorator";
    inherit packument fetchInfo;
  } // latest';

}
