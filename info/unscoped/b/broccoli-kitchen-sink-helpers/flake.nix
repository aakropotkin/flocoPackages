{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/broccoli-kitchen-sink-helpers?_rev=31-f955c350168890fd378c50f754d715f1";
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
    ident = "broccoli-kitchen-sink-helpers";
    ldir  = "info/unscoped/b/broccoli-kitchen-sink-helpers";
    inherit packument fetchInfo;
  } // latest';

}
