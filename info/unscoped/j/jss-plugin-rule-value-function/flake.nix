{

  inputs.packument.url   = "https://registry.npmjs.org/jss-plugin-rule-value-function?rev=51-db59fb00e12005e4fcfbdba3fa5fb6e3";
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
    ident = "jss-plugin-rule-value-function";
    ldir  = "info/unscoped/j/jss-plugin-rule-value-function";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
