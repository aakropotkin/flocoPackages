{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-create-regexp-features-plugin?rev=30-0b0e7200073bf8249056278fbc3d1fd2";
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
    ident = "@babel/helper-create-regexp-features-plugin";
    ldir  = "info/babel/helper-create-regexp-features-plugin";
    inherit packument fetchInfo;
  } // latest';

}
