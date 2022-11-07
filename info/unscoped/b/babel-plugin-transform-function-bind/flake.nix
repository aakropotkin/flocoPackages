{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-function-bind?rev=68-adc199b581b42350f62dee5a71e651be";
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
    ident = "babel-plugin-transform-function-bind";
    ldir  = "info/unscoped/b/babel-plugin-transform-function-bind";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
