{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.foreach?rev=46-86c50c738ed9513ad26738f3fe4d1e42";
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
    ident = "lodash.foreach";
    ldir  = "info/unscoped/l/lodash.foreach";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
