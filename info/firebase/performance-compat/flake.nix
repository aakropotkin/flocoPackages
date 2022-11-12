{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fperformance-compat?_rev=496-dc042e37d8650715c0a4fc9a8bd550a8";
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
    scope = "@firebase";
    ident = "@firebase/performance-compat";
    ldir  = "info/firebase/performance-compat";
    inherit packument fetchInfo;
  } // latest';

}
