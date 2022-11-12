{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject%2fhash?_rev=48-1cf83fb81f41edfb837e0fd63514e254";
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
    scope = "@ethersproject";
    ident = "@ethersproject/hash";
    ldir  = "info/ethersproject/hash";
    inherit packument fetchInfo;
  } // latest';

}
