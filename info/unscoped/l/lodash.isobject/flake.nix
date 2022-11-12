{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.isobject?_rev=37-0e86d6f233b4670206e95269f4c7b48a";
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
    ident = "lodash.isobject";
    ldir  = "info/unscoped/l/lodash.isobject";
    inherit packument fetchInfo;
  } // latest';

}
