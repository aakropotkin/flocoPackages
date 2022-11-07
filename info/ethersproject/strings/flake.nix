{

  inputs.packument.url   = "https://registry.npmjs.org/@ethersproject/strings?rev=44-e8903e6c59f826e9299b0f647142bc01";
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
    ident = "@ethersproject/strings";
    ldir  = "info/ethersproject/strings";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
