{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/anser?_rev=36-4bdd797e9612667afbcda009871e8604";
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
    ident = "anser";
    ldir  = "info/unscoped/a/anser";
    inherit packument fetchInfo;
  } // latest';

}
