{

  inputs.packument.url   = "https://registry.npmjs.org/@ethersproject/transactions?rev=46-e37dc3290894655bdcd755f939c71890";
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
    ident = "@ethersproject/transactions";
    ldir  = "info/ethersproject/transactions";
    inherit packument fetchInfo;
  } // latest';

}
