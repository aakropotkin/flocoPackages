{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-validator-identifier?rev=18-ecf517a8ecac64334aa020f3ceff58ad";
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
    ident = "@babel/helper-validator-identifier";
    ldir  = "info/babel/helper-validator-identifier";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
