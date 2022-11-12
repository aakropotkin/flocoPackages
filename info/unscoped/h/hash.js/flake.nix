{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hash.js?_rev=50-14123eec19319f72c7e8bdc14eedd69b";
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
    ident = "hash.js";
    ldir  = "info/unscoped/h/hash.js";
    inherit packument fetchInfo;
  } // latest';

}
