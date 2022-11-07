{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-react-remove-prop-types?rev=65-dd88cae38cca96499922b1f6fd2eb2ae";
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
    ident = "babel-plugin-transform-react-remove-prop-types";
    ldir  = "info/unscoped/b/babel-plugin-transform-react-remove-prop-types";
    inherit packument fetchInfo;
  } // latest';

}
