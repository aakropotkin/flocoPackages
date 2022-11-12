{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/memoize-one?_rev=45-34e0e1861a297d1144ebea4e17ec02c0";
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
    ident = "memoize-one";
    ldir  = "info/unscoped/m/memoize-one";
    inherit packument fetchInfo;
  } // latest';

}
