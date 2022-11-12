{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools/postcss-is-pseudo-class?_rev=10-96d8c3e91764670313166cdfb3371150";
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
    scope = "@csstools";
    ident = "@csstools/postcss-is-pseudo-class";
    ldir  = "info/csstools/postcss-is-pseudo-class";
    inherit packument fetchInfo;
  } // latest';

}
