{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bach?_rev=35-0e7908a4c9ad006f96159763a301c1ba";
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
    ident = "bach";
    ldir  = "info/unscoped/b/bach";
    inherit packument fetchInfo;
  } // latest';

}
