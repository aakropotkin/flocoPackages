{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.groupby?_rev=51-dd08a7801251a349d2d7663ec9007c12";
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
    ident = "lodash.groupby";
    ldir  = "info/unscoped/l/lodash.groupby";
    inherit packument fetchInfo;
  } // latest';

}
