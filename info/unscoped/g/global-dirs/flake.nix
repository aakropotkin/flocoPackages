{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/global-dirs?_rev=9-9d1f31651f0b82afb60cecf5df4d500a";
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
    ident = "global-dirs";
    ldir  = "info/unscoped/g/global-dirs";
    inherit packument fetchInfo;
  } // latest';

}
