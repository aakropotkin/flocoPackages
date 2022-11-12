{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bser?_rev=14-32ad82bdf16f510c9d1ce8a119ad4a06";
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
    ident = "bser";
    ldir  = "info/unscoped/b/bser";
    inherit packument fetchInfo;
  } // latest';

}
