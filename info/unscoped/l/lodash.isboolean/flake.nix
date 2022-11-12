{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.isboolean?_rev=37-7fc3f543d9331322394b076e12410270";
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
    ident = "lodash.isboolean";
    ldir  = "info/unscoped/l/lodash.isboolean";
    inherit packument fetchInfo;
  } // latest';

}
