{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/buffer-equal-constant-time?_rev=10-076daeb5d00013aac8a19df6c8575b1d";
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
    ident = "buffer-equal-constant-time";
    ldir  = "info/unscoped/b/buffer-equal-constant-time";
    inherit packument fetchInfo;
  } // latest';

}
