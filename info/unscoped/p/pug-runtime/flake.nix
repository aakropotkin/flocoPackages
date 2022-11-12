{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pug-runtime?_rev=20-2b5e41f36670d0660d72261639bd1c25";
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
    ident = "pug-runtime";
    ldir  = "info/unscoped/p/pug-runtime";
    inherit packument fetchInfo;
  } // latest';

}
