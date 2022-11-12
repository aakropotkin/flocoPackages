{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@svgr%2fbabel-plugin-add-jsx-attribute?_rev=11-31489b9f662b13fb86f3385c9eae12f1";
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
    scope = "@svgr";
    ident = "@svgr/babel-plugin-add-jsx-attribute";
    ldir  = "info/svgr/babel-plugin-add-jsx-attribute";
    inherit packument fetchInfo;
  } // latest';

}
