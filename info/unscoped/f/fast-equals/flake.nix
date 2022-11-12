{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fast-equals?_rev=41-0dd2c214cd4e7c25c45fa59a8912ff5f";
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
    ident = "fast-equals";
    ldir  = "info/unscoped/f/fast-equals";
    inherit packument fetchInfo;
  } // latest';

}
