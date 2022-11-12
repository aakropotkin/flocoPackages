{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@sindresorhus/is?_rev=49-f5f4ae64264f4f37ae7c3b7a3f1e6901";
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
    scope = "@sindresorhus";
    ident = "@sindresorhus/is";
    ldir  = "info/sindresorhus/is";
    inherit packument fetchInfo;
  } // latest';

}
