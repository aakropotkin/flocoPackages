{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-create-class-features-plugin?_rev=69-eb5361b7976d376ca60e8e984433af75";
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
    scope = "@babel";
    ident = "@babel/helper-create-class-features-plugin";
    ldir  = "info/babel/helper-create-class-features-plugin";
    inherit packument fetchInfo;
  } // latest';

}
