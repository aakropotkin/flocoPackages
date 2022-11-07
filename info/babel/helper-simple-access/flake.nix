{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-simple-access?rev=90-0fb3f5e5fb18bc1d6829053075ac3217";
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
    ident = "@babel/helper-simple-access";
    ldir  = "info/babel/helper-simple-access";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
