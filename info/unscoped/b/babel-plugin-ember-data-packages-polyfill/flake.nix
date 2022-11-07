{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-ember-data-packages-polyfill?rev=3-d380a2722d211731f40b0e8bac864238";
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
    ident = "babel-plugin-ember-data-packages-polyfill";
    ldir  = "info/unscoped/b/babel-plugin-ember-data-packages-polyfill";
    inherit packument fetchInfo;
  } // latest';

}
