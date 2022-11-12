{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bonjour?_rev=25-a266c2eecbdf1e06a93340423001aaf3";
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
    ident = "bonjour";
    ldir  = "info/unscoped/b/bonjour";
    inherit packument fetchInfo;
  } // latest';

}
