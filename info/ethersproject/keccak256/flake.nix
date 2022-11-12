{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject/keccak256?_rev=36-03b12a7e34f4d45799f2b1050d90061d";
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
    ident = "@ethersproject/keccak256";
    ldir  = "info/ethersproject/keccak256";
    inherit packument fetchInfo;
  } // latest';

}
