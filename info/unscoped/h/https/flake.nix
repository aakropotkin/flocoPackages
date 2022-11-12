{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/https?_rev=11-013fed900c0da63096ab0104a5ef58cc";
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
    ident = "https";
    ldir  = "info/unscoped/h/https";
    inherit packument fetchInfo;
  } // latest';

}
