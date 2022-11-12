{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dargs?_rev=51-5164c45c55125a1b50a6c09a81211b2b";
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
    ident = "dargs";
    ldir  = "info/unscoped/d/dargs";
    inherit packument fetchInfo;
  } // latest';

}
