{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/to-space-case?_rev=12-635a384ce2e57714cd5c2608cff7026c";
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
    ident = "to-space-case";
    ldir  = "info/unscoped/t/to-space-case";
    inherit packument fetchInfo;
  } // latest';

}
