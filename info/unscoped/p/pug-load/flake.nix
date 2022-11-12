{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pug-load?_rev=34-d1693382bd0813bdd0e3c8e26edfd4e7";
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
    ident = "pug-load";
    ldir  = "info/unscoped/p/pug-load";
    inherit packument fetchInfo;
  } // latest';

}
