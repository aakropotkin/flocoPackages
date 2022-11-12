{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-merge-longhand?_rev=65-367732abff7fd41281c5ed45b6745b0c";
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
    ident = "postcss-merge-longhand";
    ldir  = "info/unscoped/p/postcss-merge-longhand";
    inherit packument fetchInfo;
  } // latest';

}
