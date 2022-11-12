{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/reusify?_rev=12-566bed08b1f2200ac98b48f78125b80e";
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
    ident = "reusify";
    ldir  = "info/unscoped/r/reusify";
    inherit packument fetchInfo;
  } // latest';

}
