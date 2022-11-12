{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-istanbul?_rev=60-a9ae7e9e664c598356edc237ddcba8fe";
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
    ident = "babel-plugin-istanbul";
    ldir  = "info/unscoped/b/babel-plugin-istanbul";
    inherit packument fetchInfo;
  } // latest';

}
