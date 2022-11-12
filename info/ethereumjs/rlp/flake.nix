{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethereumjs%2frlp?_rev=3-d327da9e2d3f73f40016a5ee2ef1318a";
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
    scope = "@ethereumjs";
    ident = "@ethereumjs/rlp";
    ldir  = "info/ethereumjs/rlp";
    inherit packument fetchInfo;
  } // latest';

}
