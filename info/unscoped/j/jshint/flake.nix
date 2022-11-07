{

  inputs.packument.url   = "https://registry.npmjs.org/jshint?rev=494-3a941950e98b5aa84dabab8bd9e1f35a";
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
    ident = "jshint";
    ldir  = "info/unscoped/j/jshint";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
