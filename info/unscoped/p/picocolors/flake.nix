{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/picocolors?_rev=8-43b8e225822baff1837ef4f32b30c2f0";
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
    ident = "picocolors";
    ldir  = "info/unscoped/p/picocolors";
    inherit packument fetchInfo;
  } // latest';

}
