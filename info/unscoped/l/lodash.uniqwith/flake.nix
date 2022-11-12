{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.uniqwith?_rev=14-d944aee845519a1abfa3e78bb7f8566f";
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
    ident = "lodash.uniqwith";
    ldir  = "info/unscoped/l/lodash.uniqwith";
    inherit packument fetchInfo;
  } // latest';

}
