{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/through2?_rev=312-1b5f7445ca8b3362123b666203448249";
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
    ident = "through2";
    ldir  = "info/unscoped/t/through2";
    inherit packument fetchInfo;
  } // latest';

}
