{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/caniuse-lite?_rev=653-37b341df77a37438b58b679738b4f901";
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
    ident = "caniuse-lite";
    ldir  = "info/unscoped/c/caniuse-lite";
    inherit packument fetchInfo;
  } // latest';

}
