{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-environment-visitor?rev=6-a8201cf6c0dde91db8dfaa6e5f28d6cf";
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
    ident = "@babel/helper-environment-visitor";
    ldir  = "info/babel/helper-environment-visitor";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
