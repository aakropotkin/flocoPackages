{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-proposal-nullish-coalescing-operator?_rev=85-07fdd7a28e80eadab8c67b28c1d7623d";
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
    scope = "@babel";
    ident = "@babel/plugin-proposal-nullish-coalescing-operator";
    ldir  = "info/babel/plugin-proposal-nullish-coalescing-operator";
    inherit packument fetchInfo;
  } // latest';

}
