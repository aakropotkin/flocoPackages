{

  inputs.packument.url   = "https://registry.npmjs.org/jss-plugin-props-sort?rev=51-1ca4126c695ed7e76705a2b6891cfac3";
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
    ident = "jss-plugin-props-sort";
    ldir  = "info/unscoped/j/jss-plugin-props-sort";
    inherit packument fetchInfo;
  } // latest';

}
