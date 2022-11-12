{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/growl?_rev=73-79bb4fe7371c56ae029bb94079145404";
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
    ident = "growl";
    ldir  = "info/unscoped/g/growl";
    inherit packument fetchInfo;
  } // latest';

}
