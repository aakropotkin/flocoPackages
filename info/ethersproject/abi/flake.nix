{

  inputs.packument.url   = "https://registry.npmjs.org/@ethersproject/abi?rev=74-2f5ee6d0b5f97e03a872ed82030000b9";
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
    ident = "@ethersproject/abi";
    ldir  = "info/ethersproject/abi";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
