{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@tsconfig%2fnode12?_rev=13-008d9404bc1806f43bc4fc1d32237aa9";
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
    scope = "@tsconfig";
    ident = "@tsconfig/node12";
    ldir  = "info/tsconfig/node12";
    inherit packument fetchInfo;
  } // latest';

}
