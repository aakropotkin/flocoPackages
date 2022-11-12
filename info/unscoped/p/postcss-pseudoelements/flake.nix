{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-pseudoelements?_rev=15-6dfd83511eb3da7b8a83384b418ded3b";
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
    ident = "postcss-pseudoelements";
    ldir  = "info/unscoped/p/postcss-pseudoelements";
    inherit packument fetchInfo;
  } // latest';

}
