{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-syntax-nullish-coalescing-operator?_rev=70-5dde0170f4003e206794e36a15f645d4";
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
    ident = "@babel/plugin-syntax-nullish-coalescing-operator";
    ldir  = "info/babel/plugin-syntax-nullish-coalescing-operator";
    inherit packument fetchInfo;
  } // latest';

}
