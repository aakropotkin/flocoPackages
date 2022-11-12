{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/prettier-linter-helpers?_rev=2-ef8f7b7a5f7f55b4ba458784606337af";
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
    ident = "prettier-linter-helpers";
    ldir  = "info/unscoped/p/prettier-linter-helpers";
    inherit packument fetchInfo;
  } // latest';

}
