{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/setimmediate?_rev=21-573daeaafb858ed2e594715178017d4a";
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
    ident = "setimmediate";
    ldir  = "info/unscoped/s/setimmediate";
    inherit packument fetchInfo;
  } // latest';

}
