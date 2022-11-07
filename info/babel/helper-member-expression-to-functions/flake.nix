{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-member-expression-to-functions?rev=61-c0174d4bba0c0fd6fea2a901f0c34e1b";
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
    ident = "@babel/helper-member-expression-to-functions";
    ldir  = "info/babel/helper-member-expression-to-functions";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
