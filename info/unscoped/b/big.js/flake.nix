{

  inputs.packument.url   = "https://registry.npmjs.org/big.js?rev=72-97f88ba505020111fe9304af70e9a5c7";
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
    scope = null;
    ident = "big.js";
    ldir  = "info/unscoped/b/big.js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
