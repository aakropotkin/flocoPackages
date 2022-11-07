{

  inputs.packument.url   = "https://registry.npmjs.org/es6-object-assign?rev=7-499a10f478c86c5ed6b68c074685b0aa";
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
    ident = "es6-object-assign";
    ldir  = "info/unscoped/e/es6-object-assign";
    inherit packument fetchInfo;
  } // latest';

}
