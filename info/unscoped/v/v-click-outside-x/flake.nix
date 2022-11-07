{

  inputs.packument.url   = "https://registry.npmjs.org/v-click-outside-x?rev=54-b55ae2e515fa22a3258f273fa6780963";
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
    ident = "v-click-outside-x";
    ldir  = "info/unscoped/v/v-click-outside-x";
    inherit packument fetchInfo;
  } // latest';

}
