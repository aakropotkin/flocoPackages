{

  inputs.packument.url   = "https://registry.npmjs.org/unist-util-generated?rev=15-21cd25083b6a9afd6cb66b44d4229ac0";
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
    ident = "unist-util-generated";
    ldir  = "info/unscoped/u/unist-util-generated";
    inherit packument fetchInfo;
  } // latest';

}
