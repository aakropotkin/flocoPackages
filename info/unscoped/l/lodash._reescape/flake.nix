{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash._reescape?_rev=11-40bb077e0a5ab25d9705ea2531c1e228";
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
    ident = "lodash._reescape";
    ldir  = "info/unscoped/l/lodash._reescape";
    inherit packument fetchInfo;
  } // latest';

}
