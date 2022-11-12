{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/custom-event?_rev=9-90268c9a0f49f87b110ceb9c8bac3864";
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
    ident = "custom-event";
    ldir  = "info/unscoped/c/custom-event";
    inherit packument fetchInfo;
  } // latest';

}
