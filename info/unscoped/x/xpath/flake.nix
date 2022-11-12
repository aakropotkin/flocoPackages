{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/xpath?_rev=71-134adc91091fd03991c2300a11448cb8";
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
    ident = "xpath";
    ldir  = "info/unscoped/x/xpath";
    inherit packument fetchInfo;
  } // latest';

}
