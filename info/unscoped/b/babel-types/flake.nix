{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-types?_rev=203-117cc05d902fa989ef98773657855440";
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
    ident = "babel-types";
    ldir  = "info/unscoped/b/babel-types";
    inherit packument fetchInfo;
  } // latest';

}
