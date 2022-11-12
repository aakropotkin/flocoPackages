{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-add-module-exports?_rev=103-d478b3a817e988445d281acf190ae7a7";
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
    ident = "babel-plugin-add-module-exports";
    ldir  = "info/unscoped/b/babel-plugin-add-module-exports";
    inherit packument fetchInfo;
  } // latest';

}
