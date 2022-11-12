{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject/address?_rev=43-c935c06d79dbfd7ede039f3751e2d897";
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
    ident = "@ethersproject/address";
    ldir  = "info/ethersproject/address";
    inherit packument fetchInfo;
  } // latest';

}
