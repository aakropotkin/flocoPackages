{

  inputs.packument.url   = "https://registry.npmjs.org/ember-cli-babel-plugin-helpers?rev=5-1bf77b427793e0d137b1dd5a1e22a5c9";
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
    ident = "ember-cli-babel-plugin-helpers";
    ldir  = "info/unscoped/e/ember-cli-babel-plugin-helpers";
    inherit packument fetchInfo;
  } // latest';

}
