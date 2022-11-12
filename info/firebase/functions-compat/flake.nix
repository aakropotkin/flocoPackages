{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2ffunctions-compat?_rev=526-4064752c8aba05317f65fa51f7b29c1e";
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
    ident = "@firebase/functions-compat";
    ldir  = "info/firebase/functions-compat";
    inherit packument fetchInfo;
  } // latest';

}
