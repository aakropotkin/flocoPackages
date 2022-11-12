{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/micromark-util-combine-extensions?_rev=5-32dfa394c00d9f812797e0c73485311b";
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
    ident = "micromark-util-combine-extensions";
    ldir  = "info/unscoped/m/micromark-util-combine-extensions";
    inherit packument fetchInfo;
  } // latest';

}
