{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-color-functional-notation?_rev=18-1006ba799009514b5075719c92c09eb5";
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
    ident = "postcss-color-functional-notation";
    ldir  = "info/unscoped/p/postcss-color-functional-notation";
    inherit packument fetchInfo;
  } // latest';

}
