{

  inputs.packument.url   = "https://registry.npmjs.org/jss-plugin-default-unit?rev=52-0344e0063e918aed69f89d83a70a8fa2";
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
    ident = "jss-plugin-default-unit";
    ldir  = "info/unscoped/j/jss-plugin-default-unit";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
