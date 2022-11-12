{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-dynamic-modules?_rev=124-6f9946e304806bae2371ec5eabcf769a";
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
    ident = "redux-dynamic-modules";
    ldir  = "info/unscoped/r/redux-dynamic-modules";
    inherit packument fetchInfo;
  } // latest';

}
