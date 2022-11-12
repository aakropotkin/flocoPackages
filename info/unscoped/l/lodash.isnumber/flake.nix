{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.isnumber?_rev=37-46f356e85abac4a576de1ed46fb80dea";
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
    ident = "lodash.isnumber";
    ldir  = "info/unscoped/l/lodash.isnumber";
    inherit packument fetchInfo;
  } // latest';

}
