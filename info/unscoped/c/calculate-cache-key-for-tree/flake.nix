{

  inputs.packument.url   = "https://registry.npmjs.org/calculate-cache-key-for-tree";
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
    ident = "calculate-cache-key-for-tree";
    ldir  = "info/unscoped/c/calculate-cache-key-for-tree";
    inherit packument fetchInfo;
  } // latest';

}
