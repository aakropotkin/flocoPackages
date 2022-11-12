{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/snapdragon-node?_rev=16-3067a752c912e0dab3369c1067f6fc84";
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
    ident = "snapdragon-node";
    ldir  = "info/unscoped/s/snapdragon-node";
    inherit packument fetchInfo;
  } // latest';

}
