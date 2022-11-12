{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject%2fabstract-provider?_rev=49-b2866da4c28e63ecd73b57443a707ede";
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
    ident = "@ethersproject/abstract-provider";
    ldir  = "info/ethersproject/abstract-provider";
    inherit packument fetchInfo;
  } // latest';

}
