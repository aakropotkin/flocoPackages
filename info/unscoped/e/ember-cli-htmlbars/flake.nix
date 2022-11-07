{

  inputs.packument.url   = "https://registry.npmjs.org/ember-cli-htmlbars?rev=152-d1730fdf4f669a309d9618d9878d1d46";
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
    ident = "ember-cli-htmlbars";
    ldir  = "info/unscoped/e/ember-cli-htmlbars";
    inherit packument fetchInfo;
  } // latest';

}
