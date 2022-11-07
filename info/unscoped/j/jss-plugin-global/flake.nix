{

  inputs.packument.url   = "https://registry.npmjs.org/jss-plugin-global?rev=51-18dd3fbd8cfc0f5186f7c0bd662ef3bb";
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
    ident = "jss-plugin-global";
    ldir  = "info/unscoped/j/jss-plugin-global";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
