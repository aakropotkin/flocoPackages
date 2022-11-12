{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/array-series?_rev=43-6fc32f0f515b9cffc13b8b065ee453dd";
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
    ident = "array-series";
    ldir  = "info/unscoped/a/array-series";
    inherit packument fetchInfo;
  } // latest';

}
