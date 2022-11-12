{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@tsconfig/node16?_rev=4-f26b54db77e3d5e46657154661c5dfc7";
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
    ident = "@tsconfig/node16";
    ldir  = "info/tsconfig/node16";
    inherit packument fetchInfo;
  } // latest';

}
