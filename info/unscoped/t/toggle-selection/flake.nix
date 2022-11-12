{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/toggle-selection?_rev=10-314069f2db009eadff91bda6d02e3604";
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
    ident = "toggle-selection";
    ldir  = "info/unscoped/t/toggle-selection";
    inherit packument fetchInfo;
  } // latest';

}
